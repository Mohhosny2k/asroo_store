import 'package:asroo_store/core/app/env.variables.dart';
import 'package:asroo_store/core/common/screen/no_network_screen.dart';
import 'package:asroo_store/core/language/app_localizations_setup.dart';
import 'package:asroo_store/core/routes/app_routes.dart';
import 'package:asroo_store/core/style/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/app/connectivity_controller.dart';
import 'core/style/fonts/font_family_helper.dart';
import 'core/style/fonts/font_weight_helper.dart';

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
                theme: themeDark(),
                locale: Locale('en'),
                supportedLocales:AppLocalizationsSetup.supportedLocales, //[Locale('en'),Locale('ar')] ,
                localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
                localizationsDelegates:AppLocalizationsSetup.localizationsDelegates ,
                builder: (context, widget) {
                  return GestureDetector(
                    onTap: () {
                      FocusManager.instance..primaryFocus?.unfocus();
                    },
                    child: Scaffold(
                      body: Builder(builder: (context) {
                        ConnectivityController.instance.init();
                        return widget!;
                      }),
                    ),
                  );
                },
               initialRoute:AppRoutes.login , 
               onGenerateRoute: AppRoutes.onGenerateRoute,
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
//localizations