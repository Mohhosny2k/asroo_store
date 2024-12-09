import 'package:asroo_store/core/app/env.variables.dart';
import 'package:asroo_store/core/common/screen/no_network_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/app/connectivity_controller.dart';
import 'style/fonts/font_family_helper.dart';
import 'style/fonts/font_weight_helper.dart';

class AsrooStoreApp extends StatelessWidget {
  const AsrooStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: ConnectivityController.instance.isInternet,
        builder: (_, value, __) {
          if (value) {
            return ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              child: MaterialApp(
                title: 'Asroo Store',
                debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
                theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                builder: (context, widget) {
                  return Scaffold(
                    body: Builder(builder: (context) {
                      ConnectivityController.instance.init();
                      return widget!;
                    }),
                  );
                },
                home: Scaffold(
                  appBar: AppBar(
                    title: const Text('Asroo Store'),
                  ),
                  body: const Center(
                    child: Column(
                      children: [
                        Text(
                          'محمد حسني ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),

                        Text(
                          'Test Font Arabic ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),

                        //
                        Text(
                          'محمد حسني 2',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: FontFamilyHelper.cairoArabic,
                              fontWeight: FontWeightHelper.bold),
                        ),

                        Text(
                          'Test Font Arabic 2 ',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: FontFamilyHelper.poppinsEnglish,
                              fontWeight: FontWeightHelper.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return MaterialApp(
              title: 'Asroo Store',
              debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const NoNetworkScreen(),
            );
          }
        });
  }
}
