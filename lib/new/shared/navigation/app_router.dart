import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:traning/new/presentation/screens/auth/login/login_screen.dart';
import 'package:traning/new/presentation/screens/auth/otp/otp_screen.dart';
import 'package:traning/new/presentation/screens/dashboard_screen.dart';
import 'package:traning/new/shared/navigation/navigation_types.dart';
import 'package:traning/new/shared/navigation/routes.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: splashRoute,
  routes: [
    createGoRoute(loginRoute, const LoginScreen()),
    createGoRoute(otpRoute, const OtpScreen()),
    createGoRoute(dashboardRoute, const DashboardScreen()),
    /*createGoRoute(onBoardingRoute, const OnboardingScreen()),
    createGoRouteWithOptionalParams(
      dashboardRoute,
      (extra) => DashboardScreen(
        index: extra?['index'] ?? 0,
        isFromNotification: extra?['isFromNotification'] ?? true,
        isFromLocationNotification: extra?["isFromLocationNotification"] ?? true,
      ),
      onExit: (p0, p1) {
        var provider = Provider.of<DashboardProvider>(p0, listen: false);
        if (!PrefUtils().getUserLoggedIn()) {
          return true;
        }
        if (provider.currentIndex != 0) {
          provider.onTapped(0);
          return false;
        } else {
          showDialog(
            context: p0,
            builder: (context) {
              return const ExitApplicationDialog();
            },
          );
          return false;
        }
      },
    ),
    createGoRouteWithParams(
      tripListDetailsRoute,
      (extra) => TripListDetailsScreen(
          tripId: extra['trip_id'], tripNo: extra['trip_no']),
    ),*/
  ],
);
