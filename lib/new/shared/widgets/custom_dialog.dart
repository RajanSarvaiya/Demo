import 'package:flutter/material.dart';
import 'package:traning/new/shared/constants/colors.dart';
import 'package:traning/new/shared/navigation/app_router.dart';
import 'package:traning/new/shared/utils/responsive_manager.dart';
import 'package:traning/new/shared/utils/textstyles/regular_textstyles.dart';
import 'package:traning/new/shared/utils/textstyles/semi_bold_textstyles.dart';

import 'custom_button.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog(
      {super.key,
      this.title,
      this.description,
      required this.confirmBtnText,
      required this.cancelBtnText,
      required this.onConfirmTap,
      required this.onCancelTap,
      this.titleStyle,
      this.descriptionStyle,
      this.btnHeight,
      this.btnWidth,
      this.icon});

  final String? title;
  final String? description;
  final String confirmBtnText;
  final String cancelBtnText;
  final VoidCallback onConfirmTap;
  final VoidCallback onCancelTap;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final double? btnHeight;
  final double? btnWidth;
  final Widget? icon;

  @override
  State<StatefulWidget> createState() => CustomDialogState();
}

class CustomDialogState extends State<CustomDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  double defaultButtonWidth =
      MediaQuery.sizeOf(navigatorKey.currentContext!).width * 0.1;
  double defaultButtonHeight =
      MediaQuery.sizeOf(navigatorKey.currentContext!).height * 0.05;

  final Radius borderRadius = const Radius.circular(6.0);

  late BoxDecoration titleDecoration;

  late ShapeDecoration dialogDecoration;

  @override
  void initState() {
    super.initState();
    setDecoration();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  setDecoration() {
    titleDecoration = BoxDecoration(
        color: kGrey.withOpacity(0.3),
        borderRadius: BorderRadius.only(
          topLeft: borderRadius,
          topRight: borderRadius,
        ));
    dialogDecoration = ShapeDecoration(
        color: kWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: dialogDecoration,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
              visible: widget.icon != null,
              child: widget.icon ?? const SizedBox.shrink()),
          Visibility(
            visible: widget.title != null,
            child: _buildTitle(),
          ),
          Visibility(
              visible: widget.title != null,
              child:
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.01)),
          Visibility(
            visible: widget.description != null,
            child: _buildDescription(),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: ResponsiveManager.height(2), left: ResponsiveManager.width(5), right: ResponsiveManager.width(5)),
            child: _buildButtons(),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: titleDecoration,
      child: Text(
        widget.title ?? '',
        style: widget.titleStyle ?? text18SemiBold,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20, left: 15, right: 15),
      child: Text(widget.description ?? "",
          style: widget.descriptionStyle ?? text16Regular,
          textAlign: TextAlign.center),
    );
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: _buildCTAButton(
              context, widget.onCancelTap, widget.cancelBtnText),
        ),
        SizedBox(
          width: ResponsiveManager.width(5),
        ),
        Expanded(
          child: _buildCTAButton(
              context, widget.onConfirmTap, widget.confirmBtnText),
        ),
      ],
    );
  }

  Widget _buildCTAButton(
      BuildContext context, VoidCallback onTap, String title) {
    return CustomButton(
      height: ResponsiveManager.height(0.6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kPrimaryColor
      ),
      onPressed: onTap,
      btnText: title,
      btnTextStyle: text14SemiBold,
      color: kPrimaryColor,
      textColor: kBlack,
    );
  }
}
