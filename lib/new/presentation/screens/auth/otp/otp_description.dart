import 'package:flutter/material.dart';
import 'package:traning/new/shared/utils/textstyles/regular_textstyles.dart';


class OtpDescription extends StatelessWidget {
  const OtpDescription({super.key, required this.number});
  final String number;

  @override
  Widget build(BuildContext context) {
    return _buildDescription(context);
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      "We have sent the code on +91 $number",
      style: text16RegularGrey,
    );
  }
}
