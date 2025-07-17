import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';
import 'package:traning/new/shared/navigation/app_router.dart';
import 'package:traning/new/shared/navigation/routes.dart';
import 'package:traning/new/shared/utils/clear_app_data.dart';
import 'package:traning/new/shared/utils/toasts.dart';

String getErrorMessage(DioException e) {
  final context = navigatorKey.currentContext!;
  switch (e.type) {
    case DioExceptionType.sendTimeout:
      return "Sending data took too long. Please try again.";
    case DioExceptionType.receiveTimeout:
      return "The server took too long to respond. Please try again.";
    case DioExceptionType.connectionTimeout:
      return "The connection timed out. Please try again.";
    case DioExceptionType.badResponse:
      return "The server returned an invalid response.";
    case DioExceptionType.cancel:
      return "The request was cancelled.";
    default:
      return "No internet connection. Please check your network.";
  }
}

Future<void> handleUnauthorizedResponse(BuildContext context) async {
  showToast(context, 'Unauthorized', toastType: ToastificationType.error);
  await clearAppData();
  context.go(loginRoute);
}

bool isErrorResponse(int statusCode, Map<String, dynamic>? responseData) {
  return statusCode != 200 &&
      statusCode != 201 &&
      responseData != null &&
      responseData.containsKey('message');
}

void showErrorToast(BuildContext context, String message) {
  showToast(context, message, toastType: ToastificationType.error);
}
