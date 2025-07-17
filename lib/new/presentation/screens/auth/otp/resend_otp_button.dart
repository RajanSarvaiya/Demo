import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traning/new/domain/providers/auth_provider.dart';
import 'package:traning/new/shared/utils/responsive_manager.dart';
import 'package:traning/new/shared/utils/textstyles/medium_textstyles.dart';
import 'package:traning/new/shared/utils/textstyles/regular_textstyles.dart';

class ResendOtpButton extends StatelessWidget {
  const ResendOtpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return GestureDetector(
          onTap: () {
            if (provider.start == 0) {
              provider.resendOtp(context);
            }
          },
          child: Padding(
            padding: EdgeInsets.only(top: ResponsiveManager.height(3)),
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Didn't get OTP Code?\t",
                      style: text14RegularGrey,
                    ),
                    TextSpan(
                      text: (provider.start != 0)
                          ? 'Resend In ${provider.start}s'
                          : "Resend",
                      style: text14MediumPrimary,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
