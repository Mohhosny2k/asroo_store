import 'package:asroo_store/core/common/screen/under_build_screen.dart';
import 'package:asroo_store/core/features/auth/presentation/refactors/login_body.dart';
import 'package:asroo_store/core/features/auth/presentation/screens/login_screen.dart';
import 'package:asroo_store/core/routes/base_routes.dart';

import 'package:flutter/material.dart';



class AppRoutes {
  static const String login = 'login';
  static const String loginBody = 'loginBody';
  static const String signUp = 'signUp';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case login:
        return BaseRoute(page: const LoginScreen());
      case loginBody:
        return BaseRoute(page: const LoginBody());
      default:
        return BaseRoute(page:const PageUnderBuildScreen());
    }
  }
}
