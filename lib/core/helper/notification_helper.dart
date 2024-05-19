import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../main.dart';

import 'navigation_helper.dart';

class NotificationHelper {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> getPermissionsIos() async {
    if (Platform.isIOS) {
      await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
    }
  }

  Future<void> getNotifications() async {
    if (kDebugMode) {
      print("FireBaseToken");
      print(await FirebaseMessaging.instance.getToken());
    }
    getPermissionsIos();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      handleComingNotification(message);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      handleComingNotification(message);
    });
  }

  void checkIfThereIsNotificationFromBooted() async {
    RemoteMessage? message =
        await FirebaseMessaging.instance.getInitialMessage();

    if (message != null) {
      handleComingNotification(message);
    }
  }

  void handleComingNotification(RemoteMessage message) async {
    if (kDebugMode) {
      print(message.data.toString());
      print(message.notification!.title.toString());
    }
    try {
      // CoreInfo.unSeenNotificationCount += 1;
      //
      // final result = message.data["orderId"];
      // if (message.data["notificationFor"] != null && result != null) {
      //   await FcmNotificationsRepo().getNotificationDetails(
      //       int.parse(message.data["orderId"]),
      //       message.data["notificationFor"]);
      //   showNotificationDialogue(message.notification!.title!, result,
      //       getNotificationType(message.data["notificationFor"]));
      // }
    } catch (e, trace) {
      if (kDebugMode) {
        print(e);
        print(trace);
      }
    }
  }

  // static void handleNotificationNavigation(
  //     NotificationType type, dynamic result, bool fromDialog) {
  //   switch (type) {
  //     case NotificationType.car:
  //       if (kDebugMode) {
  //         print('Navigate car notification');
  //       }
  //       NavigationHelper.push(
  //           navigatorKey.currentContext!,
  //           CarDetailsPageView(
  //             carModel: CarModel(id: result.id),
  //             homePageController: null,
  //           ));
  //       break;
  //     case NotificationType.order:
  //       if (kDebugMode) {
  //         print('Navigate order notification');
  //       }
  //       NavigationHelper.push(
  //           navigatorKey.currentContext!,
  //           OrderDetailsPageView(
  //               borrowingModel: result,
  //               myBorrowingsPageController: MyBorrowingsPageController()));
  //       break;
  //     default:
  //       if (fromDialog) {
  //         Navigator.pop(navigatorKey.currentContext!);
  //         NavigationHelper.push(
  //             navigatorKey.currentContext!, const NotificationsPageView());
  //       }
  //       break;
  //   }
  // }
}
