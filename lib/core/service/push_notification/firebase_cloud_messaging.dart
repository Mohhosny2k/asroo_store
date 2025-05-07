import '../../app/env.variables.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FirebaseCloudMessaging {
  factory FirebaseCloudMessaging() {
    return _instance;
  }
  FirebaseCloudMessaging._();

  static final FirebaseCloudMessaging _instance = FirebaseCloudMessaging._();

  static const String subscribeKey = 'asroo_store';
// send notification to device with api
  Future<void> sendNotification() async {
    try {
      final response = await Dio().post<dynamic>(
          EnvVariable.instance.notificationBaseUrl,
          options: Options(
              contentType: Headers.jsonContentType,
              responseType: ResponseType.json,
              validateStatus: (_) => true,
              headers: {
                'Authorization': 'key=${EnvVariable.instance.firebaseKey}',
                'Content-Type': 'application/json',
              }),
          data: {
            'to': '/topics/$subscribeKey',
            //'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjcyLCJpYXQiOjE3MzgyMjk4NzAsImV4cCI6MTczOTk1Nzg3MH0.EXOUSBqWiK_myjrJ1vV6WWMaMGGzUuJo4KTMKKLTG9M',
            'notification': {
              'title': 'Check this Mobile {title}',
              'body': 'Rich Notification {body}',
              //'android_channel_id': 'high_importance_channel',
              //'priority': 'high',
              // 'mutable_content': true,
              // 'sound': 'Tri_tone',
            },
            // 'data': {
            //   'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            //   'id': '1',
            //   'status': 'done'
            // }
          });
      debugPrint('Response Notification Created: ${response.data}');
    } catch (e) {
      print('Error sending notification: $e');
    }
  }
}
