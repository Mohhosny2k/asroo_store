import 'core/app/app_cubit/app_cubit.dart';
import 'core/app/env.variables.dart';
import 'core/common/screen/no_network_screen.dart';
import 'core/di/injection_container.dart';
import 'core/language/app_localizations_setup.dart';
import 'core/routes/app_routes.dart';
import 'core/service/shared_pref/pref_keys.dart';
import 'core/service/shared_pref/shared_pref.dart';
import 'core/style/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            return BlocProvider(
              create: (context) => sl<AppCubit>()
                ..changeAppThemeMode(
                    sharedMode: SharedPref().getBoolean(PrefKeys.themeMode))..getSavedLanguage(),
              child: ScreenUtilInit(
                designSize: const Size(375, 812),
                minTextAdapt: true,
                child: BlocBuilder<AppCubit, AppState>(
                  buildWhen: (previous, current) {
                    return previous != current;
                    // state القديم    
                    // لا يساوي الجديد
                  },
                  builder: (context, state) {
                    final cubit = context.read<AppCubit>();
                    return MaterialApp(
                      title: 'Asroo Store',
                      debugShowCheckedModeBanner:
                          EnvVariable.instance.debugMode,
                      theme: cubit.isDark ? themeLight() :themeDark() ,
                      locale: Locale(cubit.currentLanguageCode),
                      supportedLocales: AppLocalizationsSetup
                          .supportedLocales, //[Locale('en'),Locale('ar')] ,
                      localeResolutionCallback:
                          AppLocalizationsSetup.localeResolutionCallback,
                      localizationsDelegates:
                          AppLocalizationsSetup.localizationsDelegates,
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
                      initialRoute:SharedPref().getString( PrefKeys.accessToken)!= null ?SharedPref().getString( PrefKeys.userRole) == 'admin' ?   AppRoutes.homeCustomer : AppRoutes.homeAdmin : AppRoutes.login,
                      onGenerateRoute:  AppRoutes.onGenerateRoute,
                    );
                  },
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
//localizations


