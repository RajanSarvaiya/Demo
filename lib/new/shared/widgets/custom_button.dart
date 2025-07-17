import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traning/new/domain/providers/theme_provider.dart';
import 'package:traning/new/shared/constants/colors.dart';
import 'package:traning/new/shared/utils/responsive_manager.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.btnText,
    this.btnTextStyle,
    this.onPressed,
    this.width,
    this.height,
    this.showLoader,
    this.padding,
    this.decoration,
    this.color,
    this.textColor,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();

  final String btnText;
  final TextStyle? btnTextStyle;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final bool? showLoader;
  final EdgeInsets? padding;
  final BoxDecoration? decoration;
  final Color? color;
  final Color? textColor;
}

class _CustomButtonState extends State<CustomButton> {
  bool _isButtonDisabled = false;
  Duration debounceTime = const Duration(seconds: 2);
  final EdgeInsets padding = EdgeInsets.symmetric(
    horizontal: ResponsiveManager.width(1.4),
    vertical: ResponsiveManager.width(1),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Material(
        child: InkWell(
          borderRadius: BorderRadius.circular(
            (widget.showLoader ?? false) ? 50 : 14, // Dynamic radius
          ),
          onTap: _onTap,
          child: Selector<ThemeProvider, bool>(
            selector: (context, themeProvider) => themeProvider.isDarkMode,
            builder: (BuildContext context, isDarkMode, Widget? child) {
              return Ink(
                // duration: const Duration(milliseconds: 500),
                // curve: Curves.easeInOut,
                width: widget.showLoader ?? false
                    ? 50
                    : widget.width ?? MediaQuery.of(context).size.width,
                height: ResponsiveManager.height(widget.height ?? 6),
                padding: widget.padding ?? padding,
                decoration: widget.decoration ??
                    BoxDecoration(
                      color: widget.color ?? kPrimaryColor,
                      borderRadius: BorderRadius.circular(
                        (widget.showLoader ?? false) ? 50 : 14, // Dynamic radius
                      ),
                    ),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  switchInCurve: Curves.easeIn,
                  child: (widget.showLoader ?? false)
                      ? _buildLoader(isDarkMode)
                      : _buildButtonText(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _toggleButtonState() {
    setState(() {
      _isButtonDisabled = !_isButtonDisabled;
    });
  }

  void _onTap() {
    if (!_isButtonDisabled) {
      _toggleButtonState();
      if (widget.onPressed != null) {
        widget.onPressed!();
      }
      Future.delayed(debounceTime, () {
        if (mounted) {
          _toggleButtonState();
        }
      });
    }
  }

  Widget _buildLoader(bool isDarkMode) {
    return SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        color: isDarkMode ? kPrimaryColor : kBlack,
        strokeWidth: 2,
      ),
    );
  }

  Widget _buildButtonText() {
    return Text(
      widget.btnText,
      key: ValueKey<String>(widget.btnText),
      style: widget.btnTextStyle ??
          TextStyle(
            fontSize: 18,
            color: widget.textColor,
            fontWeight: FontWeight.w500,
          ),
    );
  }
}
