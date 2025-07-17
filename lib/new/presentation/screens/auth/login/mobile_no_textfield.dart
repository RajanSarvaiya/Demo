import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traning/new/presentation/screens/auth/validators/mobile_no_validator.dart';
import 'package:traning/new/shared/constants/colors.dart';
import 'package:traning/new/shared/constants/images.dart';
import 'package:traning/new/shared/utils/responsive_manager.dart';
import 'package:traning/new/shared/widgets/custom_textfield.dart';

class MobileNoTextField extends StatelessWidget {
  const MobileNoTextField({
    super.key,
    required this.formKey,
    required this.controller,
    required this.focusNode,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      hintText: "Phone Number",
      labelText: "Phone Number",
      focusNode: focusNode,
      validator: validateMobileNo,
      keyboardType: TextInputType.phone,
      prefixIcon: _buildPrefixIcon(),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
    );
  }

  Widget _buildPrefixIcon() {
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(left: ResponsiveManager.width(4)),
            child: SvgPicture.asset(
              phoneIcon,
              height: ResponsiveManager.height(2),
            ),
          ),
          VerticalDivider(
            color: kGrey,
            endIndent: 12,
            indent: 12,
          ),
        ],
      ),
    );
  }
}
