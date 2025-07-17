import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traning/new/shared/navigation/app_router.dart';
import 'package:traning/new/shared/navigation/routes.dart';
import 'package:traning/new/shared/shared_preferences/shared_preference.dart';

clearAppData() async {
  await clearSharedPrefs();
  clearProviders();
  navigateUser();
}

clearSharedPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  PrefUtils().savePermission(true);
}

void clearProviders() {
  final context = navigatorKey.currentContext!;
  // context.read<AuthProvider>().clearProvider();

}

void navigateUser() {
  navigatorKey.currentContext!.go(loginRoute);
}