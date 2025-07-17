import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:traning/new/shared/constants/miscellaneous.dart';

const begin = Offset(1.0, 0.0);
const end = Offset.zero;
const curve = Curves.easeIn;

final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

Widget slideTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  final offsetAnimation = animation.drive(tween);
  return SlideTransition(
    position: offsetAnimation,
    child: child,
  );
}

CustomTransitionPage createCustomTransitionPage(
    GoRouterState state, Widget child) {
  return CustomTransitionPage(
    key: state.pageKey,
    transitionDuration: kNavigationDuration,
    reverseTransitionDuration: kNavigationDuration,
    child: child,
    transitionsBuilder: slideTransition,
  );
}
