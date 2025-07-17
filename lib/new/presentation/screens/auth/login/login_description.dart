import 'package:flutter/material.dart';
import 'package:traning/new/shared/utils/textstyles/regular_textstyles.dart';

class LoginDescription extends StatelessWidget {
  const LoginDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildDescription(context);
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      "Seamless and Hassle-Free Logistics,\nRight at Your Fingertips.",
      style: text16RegularGrey,
      textAlign: TextAlign.center,
    );
  }
}
