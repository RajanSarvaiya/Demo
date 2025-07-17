import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traning/new/data/api_service/api_error_handler.dart';
import 'package:traning/new/exception_handlers/app_exceptions.dart';
import 'package:traning/new/shared/navigation/app_router.dart';

void configureInterceptors(Dio dio, BuildContext context) {
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) => handleRequest(options, handler),
    onResponse: (response, handler) =>
        handleResposne(response, handler, context),
    onError: (e, handler) => handleErrorResponse(e, handler, context),
  ));
  dio.options.validateStatus = (status) => status! < 500;
}

void handleRequest(RequestOptions options, RequestInterceptorHandler handler) {
  handler.next(options);
}

handleResposne(Response response, handler, BuildContext context) {
  if (!kReleaseMode) {
    print("On Response Method Invoked ---------------------->");
  }
  try {
    if(response.statusCode == 500) {
      showErrorToast(context, 'Something went wrong...');
      final error = DioException(
        requestOptions: response.requestOptions,
        error: CustomException("Internal Server Error."),
        type: DioExceptionType.unknown,
      );
      return handler.reject(error);
    }
    else {
      final responseData = response.data as Map<String, dynamic>?;
      if (isErrorResponse(response.statusCode!, responseData)) {
        final errorMessage = responseData!['message'] as String;
        if (response.statusCode == 401) {
          handleUnauthorizedResponse(context);
        }
        else {
          showErrorToast(context, errorMessage);
          final error = DioException(
            requestOptions: response.requestOptions,
            error: CustomException(errorMessage),
            type: DioExceptionType.unknown,
          );
          return handler.reject(error);
        }
      }
    }
  } catch (e, s) {
    if (!kReleaseMode) {
      print(e);
      print(s);
    }
  }
  handler.next(response);
}

handleErrorResponse(
    DioException e,
    ErrorInterceptorHandler handler,
    BuildContext context,
    ) {
  if (kDebugMode) {
    print('On Error Method Invoked ------------------->');
  }
  stopLoader(navigatorKey.currentContext!);
  String errorMessage = '';
  BuildContext context = navigatorKey.currentContext!;

  if (e.response != null) {
    final response = e.response!;
    final statusCode = response.statusCode;
    String errorMessage = getStatusCode(statusCode!);
    if (errorMessage.isNotEmpty) {
      showErrorToast(context, errorMessage);
    }
  } else if (e.type == DioExceptionType.sendTimeout) {
    errorMessage = "Sending data took too long. Please try again.";
  } else if (e.type == DioExceptionType.receiveTimeout) {
    errorMessage = "The server took too long to respond. Please try again.";
  } else if (e.type == DioExceptionType.connectionTimeout) {
    errorMessage = "The connection timed out. Please try again.";
  } else if (e.type == DioExceptionType.badResponse) {
    errorMessage = "The server returned an invalid response.";
  } else if (e.type == DioExceptionType.badResponse) {
    errorMessage = "The server returned an invalid response.";
  } else if (e.type == DioExceptionType.cancel) {
    errorMessage = "The request was cancelled.";
  } else {
    errorMessage = "No internet connection. Please check your network.";
  }

  showErrorToast(context, errorMessage);
  // Create a custom DioException with your CustomException as the error
  final dioError = DioException(
    requestOptions: e.requestOptions,
    error: CustomException(errorMessage), // Pass your CustomException here
    type: e.type,
    message: errorMessage,
  );
  // Reject with the custom DioException
  handler.reject(dioError);

  if (!kReleaseMode) {
    if (kDebugMode) {
      print('Error Message -------------------> $errorMessage');
    }
  }
}

getStatusCode(int statusCode) {
  String code;
  final statusCodeMap = {
    400: "Bad Request: The server could not understand the request due to invalid syntax.",
    401: "Unauthorized: You must authenticate yourself to get the requested response.",
    403: "Forbidden: You do not have permission to access this resource.",
    404: "Not Found: The server could not find the requested resource.",
    422: "Unprocessable Entity: The server understands the content type of the request entity, but it could not process the instructions.",
    500: "Internal Server Error",
    502: "Bad Gateway: The server received an invalid response while acting as a gateway or proxy.",
    503: "Service Unavailable: The server is currently unavailable (overloaded or down for maintenance).",
    504: "Gateway Timeout: The server, while acting as a gateway or proxy, did not receive a timely response from an upstream server.",
  };

  if (statusCodeMap.containsKey(statusCode)) {
    code = statusCodeMap[statusCode]!;
  } else {
    code = '';
  }
  return code;
}

void stopLoader(BuildContext context) {
  // context.read<AuthProvider>().stopLoader();
}
