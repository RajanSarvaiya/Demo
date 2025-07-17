import 'package:flutter/material.dart';
import 'colors.dart';

String fontFamily = 'ZillaSlab';

ThemeData lightTheme = ThemeData(
  fontFamily: fontFamily,
  scaffoldBackgroundColor: kWhite,
  useMaterial3: false,
);

ThemeData darkTheme = ThemeData.dark(
  useMaterial3: false,
).copyWith(
  scaffoldBackgroundColor: kBlack,
);
