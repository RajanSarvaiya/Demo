import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static final PrefUtils _instance = PrefUtils._internal();

  factory PrefUtils() {
    return _instance;
  }

  PrefUtils._internal();

  SharedPreferences? _prefs;
  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  String getString(String key) {
    return _prefs?.getString(key) ?? "";
  }

  Future<bool> setString(String key, String value) {
    return _prefs?.setString(key, value) ?? Future.value(false);
  }

  int getInt(String key, int value) {
    return _prefs?.getInt(key) ?? 0;
  }

  Future<bool> setInt(String key, String value) {
    return _prefs?.setString(key, value) ?? Future.value(false);
  }

  bool getBool(String key, bool value) {
    return _prefs?.getBool(key) ?? false;
  }

  Future<bool> setBool(String key, bool value) {
    return _prefs?.setBool(key, value) ?? Future.value(false);
  }

  /// Keys
  static const String onBoardingShown = "onBoardingShown";
  static const String authToken = "authToken";
  static const String refreshToken = "refreshToken";
  static const String userLoggedIn = "userLoggedIn";
  static const String deviceUUID = "deviceUUID";
  static const String fcmToken = "fcmToken";
  static const String userId = "userId";
  static const String userEmail = "userEmail";
  static const String language = "language";
  static const String userName = "userName";
  static const String userNumber = "userNumber";
  static const String name = "name";
  static const String UserAvatar = "UserAvatar";
  static const String UserAddress = "UserAddress";
  static const String driverAssignedId = "driverAssignedId";
  static const String latitudeKey = "latitude";
  static const String longitudeKey = "longitude";
  static const String intervalTime = "intervalTime";
  static const String permission = "permission";
  static const String isServiceAllowed = "isServiceAllowed";
  // static const String serviceStatusKey = "serviceStatus";

  /// Values
  bool getOnboardingShown() => getBool(onBoardingShown, false);
  Future<bool> saveOnboardingShown(bool value) =>
      setBool(onBoardingShown, value);

  String getAuthToken() => getString(authToken);
  saveAuthToken(String? token) => _prefs?.setString(authToken, token!);

  String getRefreshToken() => getString(refreshToken);
  saveRefreshToken(String? token) => _prefs?.setString(refreshToken, token!);

  bool getUserLoggedIn() => getBool(userLoggedIn, false);
  Future<bool> saveUserLoggedIn(bool value) => setBool(userLoggedIn, value);

  String getDeviceUUID() {
    return getString(deviceUUID);
  }

  saveDeviceUUID(String uuid) {
    _prefs?.setString(deviceUUID, uuid);
  }

  String getFcmToken() => getString(fcmToken);
  Future<bool> saveFCMToken(String? token) => setString(fcmToken, token!);

  saveUserId(String id) => _prefs?.setString(id, userId);
  String getUserId() => getString(userId);

  saveUserEmail(String email) => _prefs?.setString(userEmail, email);
  String getUserEmail() => getString(userEmail);

  saveLanguage(String lan) => _prefs?.setString(language, lan);
  String getLanguage() => getString(language);

  saveUserName(String name) => _prefs?.setString(userName, name);
  String getUserName() => getString(userName);

  saveUserNumber(String name) => _prefs?.setString(userNumber, name);
  String getUserNumber() => getString(userNumber);

  saveUserAddress(String name) => _prefs?.setString(UserAddress, name);
  String getUserAddress() => getString(UserAddress);

  saveUserAvatar(String avatar) => _prefs?.setString(UserAvatar, avatar);
  String getAvatar() => getString(UserAvatar);

  saveDriverAssignedId(String avatar) => _prefs?.setString(driverAssignedId, avatar);
  String getDriverAssignedId() => getString(driverAssignedId);

  saveLatitude(String avatar) => _prefs?.setString(latitudeKey, avatar);
  String getLatitude() => getString(latitudeKey);

  saveLongitude(String avatar) => _prefs?.setString(longitudeKey, avatar);
  String getLongitude() => getString(longitudeKey);

  saveIntervalTime(int interval) => _prefs?.setInt(intervalTime, interval);
  int getIntervalTime() => getInt(intervalTime, 15);

  Future<bool> savePermission(bool isPermission) => setBool(permission, isPermission);
  bool getPermission() => getBool(permission, false);

  Future<bool> saveServicePermission(bool isPermission) => setBool(isServiceAllowed, isPermission);
  bool getServicePermission() => getBool(isServiceAllowed, false);

  // saveServiceStatus(bool status) => _prefs?.setBool(serviceStatusKey, status);
  // bool getServiceStatus() => getBool(serviceStatusKey, false);

}
