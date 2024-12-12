import 'package:asroo_store/core/common/screen/under_build_screen.dart';
import 'package:asroo_store/core/routes/base_routes.dart';
import 'package:asroo_store/test_one_screen.dart';
import 'package:flutter/material.dart';

import '../../test_two_screen.dart';

class AppRoutes {
  static const String testOne = 'testOne';
  static const String testTwo = 'testTwo';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case testOne:
        return BaseRoute(page: const TestOneScreen());
      case testTwo:
        return BaseRoute(page: const TestTwoScreen());
      default:
        return BaseRoute(page:const PageUnderBuildScreen());
    }
  }
}
