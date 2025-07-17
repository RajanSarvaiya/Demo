import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'transition.dart';

GoRoute createGoRoute(String path, Widget child) {
  return GoRoute(
    path: path,
    pageBuilder: (ctx, state) => createCustomTransitionPage(state, child),
  );
}

GoRoute createGoRouteWithParams(
    String path, Widget Function(Map<String, dynamic> extra) builder) {
  return GoRoute(
    path: path,
    pageBuilder: (ctx, state) {
      final extra = state.extra as Map<String, dynamic>;
      return createCustomTransitionPage(state, builder(extra));
    },
  );
}

GoRoute createGoRouteWithOptionalParams(
    String path, Widget Function(Map<String, dynamic>? extra) builder, {bool Function(BuildContext, GoRouterState)? onExit}) {
  return GoRoute(
    path: path,
    onExit: onExit,
    pageBuilder: (ctx, state) {
      final extra = state.extra as Map<String, dynamic>?;
      return createCustomTransitionPage(state, builder(extra));
    },
  );
}
