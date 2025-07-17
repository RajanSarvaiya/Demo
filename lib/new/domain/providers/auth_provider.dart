import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:traning/new/data/api_service/api_service.dart';
import 'package:traning/new/presentation/screens/auth/validators/otp_validator.dart';
import 'package:traning/new/shared/navigation/app_router.dart';
import 'package:traning/new/shared/navigation/routes.dart';
import 'package:traning/new/shared/shared_preferences/shared_preference.dart';
import 'package:traning/new/shared/utils/toasts.dart';

class AuthProvider extends ChangeNotifier {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  FocusNode mobileNoFocusNode = FocusNode();
  FocusNode otpFocusNode = FocusNode();
  Timer? timer;
  int start = 0;

  bool isLoading = false;

  startLoader() {
    isLoading = true;
    notifyListeners();
  }

  stopLoader() {
    isLoading = false;
    notifyListeners();
  }

  void clearOtpController() {
    otpController.clear();
    notifyListeners();
  }

  /// OTP Verification API
  Future verifyOtp(Map<String, dynamic> data) async {
    // startLoader();
    var res = await ApiService().networkService().verifyOtp(data);
    // stopLoader();
    if (res != null && res['status']) {
      PrefUtils().saveUserLoggedIn(true);
      PrefUtils().saveAuthToken(res['token']);
      PrefUtils().saveUserEmail(res['data']['user_details']['email'] ?? "test");
      PrefUtils().saveUserName(res['data']['user_details']['name']);
      PrefUtils().saveUserAvatar(res['data']['user_details']['avatar_url']);
      showToast(navigatorKey.currentContext!, res['message']);
    }
    return res['status'] ?? false;
  }

  Future onVerifyPressed() async {
    Map<String, dynamic> data = {
      "otp": 2016,
      "mobile": mobileNoController.text,
      "role": "transporter",
      "tele_code": "+91"
    };
    var isOtpValid = validateOtp(otpController.text);

    if (isOtpValid == null) {
      var res = await verifyOtp(data);
      if(res){
        openHomeScreen();
      }
    }
  }

  Future openHomeScreen() async {
      navigatorKey.currentContext!.go(dashboardRoute, extra: {
        'isFromNotification': false,
        'isFromLocationNotification' : false
      });
  }

  /// Log In API
  Future logIn(Map<String, dynamic> data) async {
    // startLoader();
    var res = await ApiService().networkService().login(data);
    if (res != null && res['data'] != null) {
      if (res != null && res['data'] != null) {
        await PrefUtils().saveUserLoggedIn(true);
        await PrefUtils().saveAuthToken(res['data']['token']);
        showToast(navigatorKey.currentContext!, res['message']);
      }
    }
    // stopLoader();
    return res['status'];
  }

  /// Resend Otp API
  Future<void> resendOtp(BuildContext context) async {
    const oneSec = Duration(seconds: 1);

    /// Resets the countdown timer
    start = 60;
    notifyListeners();
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          timer.cancel();
        } else {
          start--;
        }
        notifyListeners();
      },
    );
    clearOtpController();
  }

  /// Delete Account API
  Future deleteAccount() async {
    startLoader();
    // var res = await ApiService().networkService().deleteAccount();
    stopLoader();
    // return res;
  }

  /// Clear Auth Provider
  void clearProvider() {
    isLoading = false;
    mobileNoController.clear();
    mobileNoFocusNode.unfocus();
    loginFormKey.currentState?.reset();
    notifyListeners();
  }
}
