import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:traning/new/shared/constants/colors.dart';
import 'package:traning/new/shared/constants/miscellaneous.dart';
import 'responsive_manager.dart';
import 'textstyles/bold_textstyles.dart';

showToast(BuildContext context, String title,
    {ToastificationType? toastType, Duration? toastCloseDuration}) {
  Color shadowColor;
  switch (toastType) {
    case ToastificationType.error:
      shadowColor = kRed.withOpacity(0.5);
      break;
    case ToastificationType.info:
      shadowColor = kPrimaryColor.withOpacity(0.5);
      break;
    case ToastificationType.warning:
      shadowColor = kPrimaryColor.withOpacity(0.5);
      break;
    default:
      shadowColor = kGreen.withOpacity(0.5);
  }
  toastification.dismissAll();
  toastification.show(
      context: context,
      title: Text(
        title,
        style: text16Bold,
        maxLines: 4,
      ),
      autoCloseDuration: toastCloseDuration ?? kToastCloseDuration,
      alignment: Alignment.bottomCenter,
      animationDuration: kToastAnimationDuration,
      borderRadius: BorderRadius.circular(8),
      type: toastType ?? ToastificationType.success,
      style: ToastificationStyle.fillColored,
      boxShadow: [
        BoxShadow(color: shadowColor, blurRadius: 10, spreadRadius: 5)
      ],
      closeButtonShowType: CloseButtonShowType.none,
      margin: EdgeInsets.symmetric(
          horizontal: ResponsiveManager.width(5),
          vertical: ResponsiveManager.height(3)),
      padding: EdgeInsets.symmetric(
          horizontal: ResponsiveManager.width(5),
          vertical: ResponsiveManager.height(1)),
      progressBarTheme: ProgressIndicatorThemeData(
          color: kWhite, linearTrackColor: kWhite.withOpacity(0.5)),
      applyBlurEffect: true);
}
