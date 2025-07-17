import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traning/new/shared/constants/colors.dart';
import 'package:traning/new/shared/constants/images.dart';
import 'package:traning/new/shared/utils/clear_app_data.dart';
import 'package:traning/new/shared/utils/responsive_manager.dart';
import 'package:traning/new/shared/utils/textstyles/extra_bold_textstyles.dart';
import 'package:traning/new/shared/utils/textstyles/regular_textstyles.dart';
import 'package:traning/new/shared/utils/textstyles/semi_bold_textstyles.dart';

class ExitApplicationDialog extends StatefulWidget {
  const ExitApplicationDialog({super.key});

  @override
  ExitApplicationDialogState createState() => ExitApplicationDialogState();
}

class ExitApplicationDialogState extends State<ExitApplicationDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _scaleAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
                side: BorderSide(color: kGrey)),
            backgroundColor: kWhite,
            child: _buildContent(context),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 5, left: 40, right: 40),
          child: _buildTitle(),
        ),
        _buildCTAButtons(),
      ],
    );
  }

  Widget _buildTitle() {
    return Column(
      children: [
        SvgPicture.asset(exitIcon,
            height: ResponsiveManager.height(8),
            colorFilter: ColorFilter.mode(kOrange, BlendMode.srcIn)),
        SizedBox(height: ResponsiveManager.height(1)),
        Text(
          "Exit",
          style: text20ExtraBold,
        ),
        Text(
          "Are you sure you want to exit the application?",
          style: text16SemiBoldGrey,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildCTAButtons() {
    return IntrinsicHeight(
      child: Row(
        children: [
          _buildButton("Cancel",
              () => Navigator.pop(context),
              isCancel: true),
          SizedBox(
            height: ResponsiveManager.height(2),
            child: VerticalDivider(color: kGrey),
          ),
          _buildButton("Exit", _onExitTap),
        ],
      ),
    );
  }

  Widget _buildButton(String title, VoidCallback onTap, {bool? isCancel}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: ResponsiveManager.height(6),
          width: ResponsiveManager.width(5),
          decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Center(
            child: Text(title,
                style: isCancel == true ? text16RegularRed : text16Regular),
          ),
        ),
      ),
    );
  }

  Future<void> _onExitTap() async {
    clearAppData();
    exit(0);
  }
}
