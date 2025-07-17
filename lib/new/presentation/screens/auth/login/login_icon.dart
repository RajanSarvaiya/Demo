import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traning/new/shared/constants/colors.dart';
import 'package:traning/new/shared/constants/images.dart';

class LoginIcon extends StatelessWidget {
  const LoginIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          border: Border.all(color: kLightGrey,width: 1),
          borderRadius: BorderRadius.circular(28),
          color: kWhite,
          boxShadow: [
            BoxShadow(
              color: kGrey.withOpacity(0.5),
              blurRadius: 5.0,
              offset: const Offset(0, 2),
            )
          ]),
      child: SvgPicture.asset(loginIcon),
    );
  }
}
