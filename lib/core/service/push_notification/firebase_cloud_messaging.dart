import 'package:asroo_store/core/app/env.variables.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FirebaseCloudMessaging {
  factory FirebaseCloudMessaging() {
    return _instance;
  }
  FirebaseCloudMessaging._();

  static final FirebaseCloudMessaging _instance = FirebaseCloudMessaging._();
// send notification to device with api
  Future<void> sendNotification() async {
 try{
     final response = await Dio().post<dynamic>(
        '${EnvVariable.instance.notificationBaseUrl}',
        options: Options(
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
            validateStatus: (_) => true,
            headers: {
              'Authorization':
                  'key=${EnvVariable.instance.firebaseKey}',
              'Content-Type': 'application/json',
            }
            

            
            ) , data: {
              'to': '<Device FCM token>',
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
            debugPrint
('Response Notification Created: ${response.data}');
  } catch (e) {
    print('Error sending notification: $e');
  }
 }
}
