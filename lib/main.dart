/*
import 'package:flutter/material.dart';
import 'package:traning/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practice',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const MyHomePage(),
    );
  }
}
*/



import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'package:traning/new/domain/providers/auth_provider.dart';
import 'package:traning/new/domain/providers/dashboard/dashboard_provider.dart';
import 'package:traning/new/domain/providers/dashboard/home/home_provider.dart';
import 'package:traning/new/domain/providers/locale_provider.dart';
import 'package:traning/new/domain/providers/notification_provider.dart';
import 'package:traning/new/domain/providers/theme_provider.dart';
import 'package:traning/new/service/notification_service/firebase_options.dart';
import 'package:traning/new/shared/constants/miscellaneous.dart';
import 'package:traning/new/shared/constants/themes.dart';
import 'package:traning/new/shared/navigation/app_router.dart';
import 'package:traning/new/shared/shared_preferences/shared_preference.dart';
import 'package:traning/new/shared/utils/https_override.dart';
import 'package:traning/new/shared/utils/responsive_manager.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  HttpOverrides.global = MyHttpOverrides();
  await PrefUtils().init();

  /*PushNotificationsManager.getInstance().init();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);*/
  requestAndroidPermission();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => LocaleProvider()),
    ChangeNotifierProvider(create: (_) => DashboardProvider()),
    ChangeNotifierProvider(create: (_) => NotificationProvider()),
    ChangeNotifierProvider(create: (_) => HomeProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveManager.init(context);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
    );
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, context) {
          return Consumer2<ThemeProvider, LocaleProvider>(
            builder:
                (BuildContext context, themeProvider, localeProvider, Widget? child) {
              return ToastificationWrapper(
                config: const ToastificationConfig(
                    animationDuration: kToastAnimationDuration),
                child: MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  title: 'Transport Driver',
                  routerConfig: router,
                  theme: lightTheme,
                  themeMode:
                  themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
                  darkTheme: darkTheme,
                  themeAnimationCurve: Curves.easeIn,
                  // supportedLocales: AppLocalizations.supportedLocales,
                  // localizationsDelegates: AppLocalizations.localizationsDelegates,
                  locale: localeProvider.locale,
                  scrollBehavior: const ScrollBehavior(),
                ),
              );
            },
          );
        }
    );
  }
}

/*@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  PushNotificationsManager.getInstance().handleBackgroundMessage(message);
}*/

Future<void> requestAndroidPermission() async {
  var status = await Permission.notification.status;
  if (status != PermissionStatus.granted) {
    status = await Permission.notification.request();
  }
}