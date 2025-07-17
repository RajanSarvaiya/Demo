import 'package:flutter/material.dart';
import 'package:traning/new/shared/utils/responsive_manager.dart';
import 'package:traning/new/shared/utils/textstyles/semi_bold_textstyles.dart';

class OtpTitle extends StatelessWidget {
  const OtpTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ResponsiveManager.height(2)),
      child: _buildTitle(context),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Center(
      child: Text(
        "OTP Verification",
        style: text32SemiBold,
      ),
    );
  }
}
