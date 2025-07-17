import 'package:flutter/material.dart';

class ResponsiveManager {
  static late double screenWidth;
  static late double screenHeight;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
  }

  static double width(double percent) => screenWidth * (percent / 100);
  static double height(double percent) => screenHeight * (percent / 100);
}
