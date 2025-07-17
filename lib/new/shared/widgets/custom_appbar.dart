import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:traning/new/shared/constants/colors.dart';
import 'package:traning/new/shared/navigation/app_router.dart';
import 'package:traning/new/shared/utils/textstyles/extra_bold_textstyles.dart';

customAppBar(
    {String? title, VoidCallback? onBackPressed, Widget? titleWidget}) {
  return AppBar(
    backgroundColor: kWhite,
    leading: BackButton(
      color: kBlack,
      onPressed: onBackPressed ?? navigatorKey.currentContext!.pop,
    ),
    elevation: 0,
    centerTitle: true,
    title: titleWidget ??
        Text(
          title ?? '',
          style: text18ExtraBold.copyWith(color: kBlack),
        ),
  );
}
