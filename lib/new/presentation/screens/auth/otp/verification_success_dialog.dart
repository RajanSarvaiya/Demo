import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traning/new/shared/constants/colors.dart';
import 'package:traning/new/shared/constants/images.dart';
import 'package:traning/new/shared/utils/responsive_manager.dart';
import 'package:traning/new/shared/utils/textstyles/semi_bold_textstyles.dart';

class VerificationSuccessDialog extends StatefulWidget {
  const VerificationSuccessDialog({super.key});

  @override
  State<VerificationSuccessDialog> createState() =>
      _VerificationSuccessDialogState();
}

class _VerificationSuccessDialogState extends State<VerificationSuccessDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late BoxDecoration decoration;
  late BoxDecoration dialogDecoration;
  late EdgeInsets dialogPadding;

  @override
  void initState() {
    super.initState();
    setDecoration();
    setpadding();
    setAnimations();
  }

  setDecoration() {
    decoration = BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: kPrimaryColor.withOpacity(0.5),
            blurRadius: 4.0,
            offset: const Offset(0, 4.0),
          )
        ]);
    dialogDecoration = BoxDecoration(
      color: kWhite, // Your dialog background color
      borderRadius: BorderRadius.circular(22),
    );
  }

  setpadding() {
    dialogPadding = EdgeInsets.symmetric(
      horizontal: ResponsiveManager.width(20),
      vertical: ResponsiveManager.height(4),
    );
  }

  setAnimations() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Container(
          decoration: dialogDecoration,
          padding: dialogPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildVerifyIcon(),
              _buildTitle(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVerifyIcon() {
    return Container(
      decoration: decoration,
      padding: const EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: ResponsiveManager.height(2)),
      child: SvgPicture.asset(
        successIcon,
        height: ResponsiveManager.height(4),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      "Verification\nSuccessful",
      style: text24SemiBold,
      textAlign: TextAlign.center,
    );
  }
}
