import 'package:flutter/material.dart';
import 'package:traning/new/shared/constants/colors.dart';
import 'package:traning/new/shared/utils/responsive_manager.dart';
class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: ResponsiveManager.height(2)),
      child: CircularProgressIndicator.adaptive(
        backgroundColor: kWhite,
        valueColor: AlwaysStoppedAnimation<Color>(kOrange),
      ),
    );
  }
}