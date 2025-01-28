import 'package:asroo_store/core/di/inject_container.dart';
import 'package:asroo_store/core/helper/extensions/context_extension.dart';
import 'package:asroo_store/core/routes/routes.dart';
import 'package:asroo_store/core/services/push_notification/local_notfication_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseMessagingNavigate {
  // forground
  static Future<void> forGroundHandler(RemoteMessage? message) async {
    if (message != null) {
      await LocalNotificationService.showSimpleNotification(
        title: message.notification!.title ?? '',
        body: message.notification!.body ?? '',
        payload: message.data['productId'].toString(),
      );
    }
  }

  // background
  static void backGroundHandler(RemoteMessage? message) {
    if (message != null) {
      _navigate(message);
    }
  }

  // terminated
  static void terminatedHandler(RemoteMessage? message) {
    if (message != null) {
      _navigate(message);
    }
  }

  static void _navigate(RemoteMessage message) {
    if (int.parse(message.data['productId'].toString()) == -1) return;
    sl<GlobalKey<NavigatorState>>().currentState!.context.pushNamed(
          Routes.productDetailsScreen,
          arguments: int.parse(message.data['productId'].toString()),
        );
  }
}
