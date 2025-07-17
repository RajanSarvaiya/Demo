import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:traning/new/shared/navigation/app_router.dart';
import 'package:traning/new/shared/shared_preferences/shared_preference.dart';
import 'api_service_helper.dart';
import 'interceptors_config.dart';
import 'network_service.dart';

class ApiService {
  final Dio dio = Dio();

  ApiService() {
    configureInterceptors(dio, navigatorKey.currentContext!);
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
  }

  NetworkService networkService({bool isMultipartData = false}) {
    print('Authorization Header: ${getDeviceIdHeader()}');
    dio.options
      ..connectTimeout = const Duration(milliseconds: 50000)
      ..receiveTimeout = const Duration(milliseconds: 50000)
      ..headers = {
        "Content-Type":
            isMultipartData ? "multipart/form-data" : "application/json",
        "Accept": "application/json",
        "Authorization": getAuthorizationHeader(),
        "device-id": getDeviceIdHeader(),
        "fcm-token": PrefUtils().getFcmToken().toString(),
      };

    return NetworkService(
      dio,
    );
  }

}