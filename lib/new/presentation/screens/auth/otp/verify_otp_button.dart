import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'package:traning/new/domain/providers/auth_provider.dart';
import 'package:traning/new/shared/constants/colors.dart';
import 'package:traning/new/shared/navigation/app_router.dart';
import 'package:traning/new/shared/navigation/routes.dart';
import 'package:traning/new/shared/utils/responsive_manager.dart';
import 'package:traning/new/shared/widgets/custom_button.dart';
import 'verification_success_dialog.dart';

class VerifyOtpButton extends StatelessWidget {
  const VerifyOtpButton({super.key, required this.provider});
  final AuthProvider provider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: ResponsiveManager.height(2),
      ),
      child: Center(
        child: CustomButton(
          btnText: "Continue",
          onPressed: provider.isLoading ? null : () {
            _onVerifyPressed(context);
          },
          showLoader: provider.isLoading, color: kPrimaryColor, textColor: kBlack,
        ),
      ),
    );
  }

  _onVerifyPressed(BuildContext context) async {
    openHomeScreen();
 /*   var provider = Provider.of<AuthProvider>(context, listen: false);
    String otp = provider.otpController.text.trim();

    // Validate OTP
    if (otp.isEmpty || otp.length != 4) {
      showToast(context, 'Please enter a valid 4-digit OTP', toastType: ToastificationType.error);
      return;
    }
    provider.onVerifyPressed();*/
  }
  Future openHomeScreen() async {
    navigatorKey.currentContext!.go(dashboardRoute);
  }

  /*onVerifyPressed(BuildContext context) async {
    var provider = Provider.of<AuthProvider>(context, listen: false);
    Map<String, dynamic> data = {
      "otp": 2016,
      "mobile": "+91" '${provider.mobileNoController.text}',
      "role": "transporter"
    };
    var isOtpValid = validateOtp(provider.otpController.text);
    if (isOtpValid == null) {
      var res = await provider.verifyOtp(data);
      if (res) {
        _openHomeScreen(context);
      }
    } else {
      showToast(context, isOtpValid, toastType: ToastificationType.error);
    }
  }*/

  /*_openHomeScreen(BuildContext context) {
    _showVerificationSuccessDialog(context);
    Future.delayed(const Duration(seconds: 3), () {
      context.push(dashboardRoute, extra: {
        'isFromNotification': false,
        'isFromLocationNotification' : false
      });
    });
  }*/

  /*_showVerificationSuccessDialog(BuildContext context) {
    return showAdaptiveDialog(
      context: context,
      builder: (BuildContext context) {
        return const VerificationSuccessDialog();
      },
    );
  }*/
}