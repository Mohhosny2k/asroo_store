import 'package:asroo_store/asroo_store_app.dart';
import 'package:asroo_store/core/app/bloc_observer.dart';
import 'package:asroo_store/core/app/env.variables.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvVariable.instance.init(envtype: EnvTypeEnum.dev);
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyDNid_h4ebw0_bJyH0Wre1zQxcx83JgYBg", // current key
              appId:
                  "1:654396066033:android:2475d4030d936118cc0150", // "mobilesdk_app_id": ,
              messagingSenderId: "654396066033", //"project_number": ,
              projectId: "asroostore-57dce" //"project_id": ,
              ))
      : await Firebase.initializeApp();
      Bloc.observer = AppBlocObserver();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const AsrooStoreApp());
  });
}
