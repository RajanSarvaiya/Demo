import 'dart:async';
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationsManager {
  static late PushNotificationsManager _instance;
  late FirebaseMessaging _firebaseMessaging;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  PushNotificationsManager._internal();

  List<String> messages = [];
  List<String> notificationIds = [];
  int notificationId = -1;

  static PushNotificationsManager getInstance() {
    _instance = PushNotificationsManager._internal();
    _instance._firebaseMessaging = FirebaseMessaging.instance;
    return _instance;
  }

  Future init() async {
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onMessage.listen(handleBackgroundMessage);

    flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: DarwinInitializationSettings()),
      onDidReceiveNotificationResponse: onSelectNotification,
    );
  }

  Future<void> handleMessage(RemoteMessage message) async {
    debugPrint('handlePushNotification: ${message.data.toString()}');
  }

  /// Background notification handler
  @pragma('vm:entry-point')
  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    print("background");
    handleBackgroundMessage(message);
  }

  void handleBackgroundMessage(RemoteMessage message) {
    if (message.data.isNotEmpty) {
      print(
          "handleBackgroundMessage :::::::::::::::::: ${message.data.toString()}");
      messages.clear();
      // notificationIds.clear();
    }
    notificationId = int.parse(message.data['idContent'].toString());
    messages.add(message.data['body'].toString());
    // notificationIds.add(message.data['idContent'].toString());
    int id = int.parse(message.data['idContent'].toString());
    String title = message.data['title'];
    String body = message.data['body'];
    String groupKey = message.data['idContent'].toString();

    // if (message.data.isNotEmpty) {
    try {
      flutterLocalNotificationsPlugin.show(
          id,
          title,
          body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              'mediatorChannel',
              'mediatorChannel',
              groupKey: groupKey,
              fullScreenIntent: true,
              playSound: true,
              importance: Importance.high,
              priority: Priority.high,
              styleInformation: BigTextStyleInformation(body),
              // styleInformation: InboxStyleInformation(
              //   messages,
              // ),
            ),
          ),
          payload: jsonEncode(message.data));
    } catch (e, s) {
      print("error  $e \n----------$s");
      // }
    }
  }

  void onSelectNotification(NotificationResponse? response) {
    messages.clear();
    String? payload = response?.payload;
    debugPrint('onSelectNotification: $payload');
    var data = jsonDecode(payload!);
    if (data['click_action'] != null) {
      /*if (data['click_action'] == activeOrderDetailsRoute) {
        Navigator.push(
            navigatorKey.currentContext!,
            MaterialPageRoute(
              builder: (context) => ActiveOrderDetailsScreen(
                orderNo: data['order_no'],
                driverId: data.containsKey("driver_id") ? data['driver_id'] : "",
                assignedId: data['assigned_id'],
                status: "active",
                isHomeStats: false,
                isFromAll: false,
                isNotification: true,
              ),
            ));
      }
      else if (data['click_action'] == unassignedOrderDetailsRoute) {
        Navigator.push(
            navigatorKey.currentContext!,
            MaterialPageRoute(
              builder: (context) => UnassignedOrderDetailsScreen(
                orderNo: data['order_no'],
                assignedId: data['assigned_id'],
                status: "unassigned",
                isHomeStats: false,
                isFromAll: false,
                isNotification: true,
              ),
            ));
      }
      else if (data['click_action'] == assignedOrderDetailsRoute) {
        Navigator.push(
            navigatorKey.currentContext!,
            MaterialPageRoute(
              builder: (context) => AssignedOrderDetailsScreen(
                orderNo: data['order_no'],
                assignedId: data['assigned_id'],
                status: "assigned",
                isFromAll: false,
                isNotification: true,
              ),
            ));
      }
      else if (data['click_action'] == completedOrderDetailsRoute) {
        Navigator.push(
            navigatorKey.currentContext!,
            MaterialPageRoute(
              builder: (context) => CompletedOrderDetailsScreen(
                orderNo: data['order_no'],
                assignedId: data['assigned_id'],
                status: "completed",
                isFromAll: false,
                isNotification: true,
              ),
            ));
      }
      else if (data['click_action'] == cancelledOrderDetailsRoute) {
        Navigator.push(
            navigatorKey.currentContext!,
            MaterialPageRoute(
              builder: (context) => CancelledOrderDetailsScreen(
                orderNo: data['order_no'],
                assignedId: data['assigned_id'],
                status: "cancelled",
                isNotification: true,
              ),
            ));
      }
      else if (data['click_action'] == fleetHistoryDetailsRoute) {
        Navigator.push(
          navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => FleetEarningDetails(
              title: data['earning_title'],
              amount: data['earning_amount'],
              image: data['image'],
              receivedTitle: data['received_title'],
              receivedValue: data['received_amount'],
              outstandingTitle: data['outstanding_title'],
              outstandingValue: data['outstanding_amount'],
              isHomeStats: false,
              isNotification: true,
            ),
          ),
        );
      }*/
      // navigatorKey.currentContext!.push(data['click_action']);
    }
  }
}
