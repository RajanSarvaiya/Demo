import 'package:flutter/material.dart';
import 'package:traning/new/shared/constants/colors.dart';
import 'package:traning/new/shared/utils/responsive_manager.dart';
import 'package:traning/new/shared/utils/textstyles/bold_textstyles.dart';
import 'package:traning/new/shared/utils/textstyles/regular_textstyles.dart';
import 'package:traning/new/shared/widgets/custom_button.dart';

class CustomBottomSheet extends StatelessWidget {
  final String? title;
  final String? description;
  final Widget content;
  final VoidCallback? onConfirm;
  final String? buttonTitle;
  final bool showConfirmButton;
  final bool? isLoading;

  const CustomBottomSheet({
    super.key,
    this.title,
    required this.content,
    this.onConfirm,
    this.buttonTitle,
    this.description,
    required this.showConfirmButton,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Visibility(visible: title != null, child: _buildTitle()),
        Visibility(
          visible: description != null,
          child: _buildDescription(),
        ),
        content,
        Visibility(visible: showConfirmButton, child: _buildConfirmButton()),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      title ?? '',
      style: text28Bold,
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ResponsiveManager.height(1)),
      child: Text(
        description ?? '',
        style: text14RegularGrey,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildConfirmButton() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: ResponsiveManager.height(1),
          horizontal: ResponsiveManager.width(5)),
      child: CustomButton(
        btnText: buttonTitle ?? '',
        onPressed: onConfirm,
        showLoader: isLoading ?? false,
        color: kPrimaryColor,
        textColor: kBlack,
      ),
    );
  }
}
