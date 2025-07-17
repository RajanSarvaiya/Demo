
import 'package:traning/new/shared/shared_preferences/shared_preference.dart';

String getAuthorizationHeader() {
  final accessToken = PrefUtils().getAuthToken().toString();
  return accessToken.isNotEmpty ? 'Bearer $accessToken' : '';
}

String getDeviceIdHeader() {
  final deviceUUID = PrefUtils().getDeviceUUID().toString();
  return deviceUUID.isNotEmpty ? deviceUUID : 'dfgdfgdfgfdgdfg';
}
