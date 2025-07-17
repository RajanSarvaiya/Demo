import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:smart_auth/smart_auth.dart';
import 'package:toastification/toastification.dart';
import 'package:traning/new/domain/providers/auth_provider.dart';
import 'package:traning/new/shared/constants/colors.dart';
import 'package:traning/new/shared/utils/responsive_manager.dart';
import 'package:traning/new/shared/utils/textstyles/bold_textstyles.dart';
import 'sms_retriever.dart';

class OtpTextField extends StatefulWidget {
  const OtpTextField({super.key, required this.provider});

  @override
  State<OtpTextField> createState() => _OtpTextFieldState();
  final AuthProvider provider;
}

class _OtpTextFieldState extends State<OtpTextField> {
  final defaultPinTheme = PinTheme(
    width: ResponsiveManager.width(16),
    height: ResponsiveManager.height(8),
    textStyle: text18Bold.copyWith(color: kBlack.withOpacity(0.7)),
    decoration: BoxDecoration(
      color: kPrimaryColor.withOpacity(0.1),
      shape: BoxShape.circle,
    ),
  );

  late final SmsRetrieverImpl smsRetrieverImpl;

  @override
  void initState() {
    super.initState();
    smsRetrieverImpl = SmsRetrieverImpl(SmartAuth());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Pinput(
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: defaultPinTheme,
        animationCurve: Curves.easeIn,
        controller: widget.provider.otpController,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        showCursor: true,
        smsRetriever: smsRetrieverImpl,
        cursor: VerticalDivider(
            color: kPrimaryColor,
            endIndent: ResponsiveManager.height(2.5),
            indent: ResponsiveManager.height(2.5),
            thickness: 2),
        onCompleted: _onCompleted,
        separatorBuilder: (index) =>
            SizedBox(width: ResponsiveManager.width(5)),
        focusNode: widget.provider.otpFocusNode,
        onTapOutside: (event) => widget.provider.otpFocusNode.unfocus(),
      ),
    );
  }

  _onCompleted(String value) async {
    var provider = Provider.of<AuthProvider>(context, listen: false);
    Map<String, dynamic> data = {"otp": provider.otpController.text};
    // var isOtpValid = provider.validateOtp(provider.otpController.text);
    // if (isOtpValid == null) {
    //   // await provider.verifyOtp(data);

    //   _openHomeScreen();
    // } else {
    //   showToast(context, isOtpValid, toastType: ToastificationType.error);
    // }
  }

  _openHomeScreen() {
    // context.go(homeRoute);
  }
}
