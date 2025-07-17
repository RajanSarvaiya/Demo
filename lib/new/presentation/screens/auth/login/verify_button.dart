import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:traning/new/domain/providers/auth_provider.dart';
import 'package:traning/new/shared/constants/colors.dart';
import 'package:traning/new/shared/navigation/routes.dart';
import 'package:traning/new/shared/widgets/custom_button.dart';

class VerifyButton extends StatefulWidget {
  const VerifyButton({
    super.key,
    required this.provider,
  });

  @override
  State<VerifyButton> createState() => _VerifyButtonState();
  final AuthProvider provider;
}

class _VerifyButtonState extends State<VerifyButton> {
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      btnText: "Verify",
      onPressed: widget.provider.isLoading ? null : _onLoginPressed,
      showLoader: widget.provider.isLoading, color: kPrimaryColor, textColor: kBlack,
    );
  }

  _onLoginPressed() async {
    _openOtpScreen();
    // Map<String, dynamic> data = {
    //   "mobile": widget.provider.mobileNoController.text,
    //   "role": "transporter",
    //   "tele_code": "+91"
    // };
    // if (widget.provider.loginFormKey.currentState!.validate()) {
    //   var res = await widget.provider.logIn(data);
    //   if (res ?? false) {
    //   _openOtpScreen();
    //   }
    // }
  }

  _openOtpScreen() {
      context.push(otpRoute);
  }
}
