import 'package:asroo_store/core/extensions/context_extensions.dart';
import 'package:asroo_store/core/language/lang_keys.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:flutter/material.dart';

import 'core/routes/app_routes.dart';

class TestOneScreen extends StatelessWidget {
  const TestOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title:const Text('one'),
      ),
      body: Column(
        children: [
          Center(
              child: TextButton(
                  onPressed: () {
                  //  Navigator.of(context).pushNamed(AppRoutes.testTwo);
                  context.pushName(AppRoutes.testTwo);
                  },
                  child: Text('Go Two Screen',
                      style: TextStyle(color: context.color.mainColor)))),
        Text(context.translate(LangKeys.appName) ,),
        Image.asset(context.assets.testImage!,fit: BoxFit.fill,)
        ],
      ),
    );
  }
}
