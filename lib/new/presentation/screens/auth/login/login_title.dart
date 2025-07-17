import 'package:flutter/material.dart';
import 'package:traning/new/shared/utils/textstyles/semi_bold_textstyles.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildTitle(context);
  }

  Widget _buildTitle(BuildContext context) {
    return Center(
      child: Text(
        "Welcome!",
        style: text32SemiBold,
      ),
    );
  }
}
