import 'package:asroo_store/core/service/push_notification/firebase_cloud_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../../../../core/common/widgets/admin_app_bar.dart';
import '../../../../../core/style/colors/colors_dark.dart';
import 'package:flutter/material.dart';

class AddNotificationsScreen extends StatelessWidget {
  const AddNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: ColorsDark.mainColor,
        appBar:const AdminAppBar(
          title: 'Add Notifications',
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
        ),
    
     body: Center(child: InkWell(
      onTap: () async{
         // final token =await FirebaseMessaging.instance.getToken();
          //eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjcyLCJpYXQiOjE3MzgyMjk4NzAsImV4cCI6MTczOTk1Nzg3MH0.EXOUSBqWiK_myjrJ1vV6WWMaMGGzUuJo4KTMKKLTG9M
      await  FirebaseCloudMessaging().sendNotification();
      },
      child: Text('Add Notifications Screen'))),
      );
  }
}