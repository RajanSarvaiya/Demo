import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:traning/new/shared/constants/uri.dart';
part 'network_service.g.dart';

@RestApi(baseUrl: "")
abstract class NetworkService {
  factory NetworkService(
    Dio dio,
  ) = _NetworkService;

  @POST(signInUrl)
  Future<dynamic> login(@Body() Map<String, dynamic> data);

  @POST(verifyOtpUrl)
  Future<dynamic> verifyOtp(@Body() Map<String, dynamic> data);

  @GET(notificationListUrl)
  Future</*NotificationList*/dynamic> getNotificationList(@Path() String pageNo);

}
