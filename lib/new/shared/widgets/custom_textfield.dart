import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:traning/new/shared/constants/colors.dart';
import 'package:traning/new/shared/utils/textstyles/regular_textstyles.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final TextStyle? style;
  final TextInputType? keyboardType;
  final bool? enable;
  final ValueChanged<String>? onChanged;
  final EdgeInsets? contentPadding;
  final bool? autofocus;
  final VoidCallback? onTap;
  final Icon? icon;
  final TextStyle? labelTextStyle;
  final TextStyle? hintTextStyle;
  final Widget? prefixIcon;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autoValidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final bool? filled;
  final Color? fillColor;
  final int? maxLines;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final InputBorder? textFieldBorder;
  final Function()? onEditingCompleted;
  final TextCapitalization? textCapitalization;
  final bool? obscureText;

  const CustomTextField({
    super.key,
    required this.controller,
    this.labelText,
    this.style,
    this.keyboardType,
    this.enable,
    this.onChanged,
    this.contentPadding,
    this.onTap,
    this.icon,
    this.labelTextStyle,
    this.prefixIcon,
    this.validator,
    this.autoValidateMode,
    this.inputFormatters,
    this.focusNode,
    this.suffixIcon,
    this.filled,
    this.maxLines,
    this.fillColor,
    this.floatingLabelBehavior,
    this.hintText,
    this.hintTextStyle,
    this.textFieldBorder,
    this.autofocus,
    this.onEditingCompleted,
    this.textCapitalization,
    this.obscureText,
  });

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  static OutlineInputBorder inputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: kLightGrey,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(16.0)));

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        widget.onTap != null ? widget.onTap!() : null;
        setState(() {});
      },
      onTapOutside: (event) {
        setState(() {
          widget.focusNode?.unfocus();
        });
      },
      controller: widget.controller,
      autocorrect: false,
      autofocus: widget.autofocus ?? false,
      enabled: widget.enable,
      textCapitalization:
          widget.textCapitalization ?? TextCapitalization.sentences,
      cursorColor: kPrimaryColor,
      style: text14Regular,
      textAlignVertical: TextAlignVertical.center,
      obscureText: widget.obscureText ?? false,
      autovalidateMode:
          widget.autoValidateMode ?? AutovalidateMode.onUserInteraction,
      inputFormatters: widget.inputFormatters,
      validator: widget.validator,
      focusNode: widget.focusNode,
      maxLines: widget.maxLines ?? 1,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: kRed),
        alignLabelWithHint: true,
        filled: widget.filled ?? false,
        fillColor: widget.fillColor ?? kPrimaryColor.withOpacity(0.2),
        focusedBorder: widget.textFieldBorder ??
            inputBorder.copyWith(
              borderSide: widget.focusNode != null && widget.focusNode!.hasFocus
                  ? BorderSide(color: kLightGrey)
                  : inputBorder.borderSide,
            ),
        enabledBorder: widget.textFieldBorder ?? inputBorder,
        border: widget.textFieldBorder ?? inputBorder,
        disabledBorder: widget.textFieldBorder ?? inputBorder,
        errorBorder: widget.textFieldBorder ??
            inputBorder.copyWith(
                borderSide: BorderSide(color: kRed, width: 1.5)),
        focusedErrorBorder: widget.textFieldBorder ??
            inputBorder.copyWith(
              borderSide: widget.focusNode != null && widget.focusNode!.hasFocus
                  ? BorderSide(color: kRed, width: 1)
                  : inputBorder.borderSide,
            ),
        contentPadding:
            widget.contentPadding ?? const EdgeInsets.symmetric(horizontal: 20),
        labelText: widget.labelText ?? '',
        hintText: widget.hintText ?? '',
        floatingLabelBehavior:
            widget.floatingLabelBehavior ?? FloatingLabelBehavior.never,
        labelStyle: widget.labelTextStyle ?? text14RegularGrey,
        hintStyle: widget.hintTextStyle ?? text14RegularGrey,
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
      ),
      keyboardType: widget.keyboardType,
      onEditingComplete: widget.onEditingCompleted,
      onChanged: widget.onChanged,
    );
  }
}
