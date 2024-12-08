import 'package:asroo_store/core/images/app_images.dart';
import 'package:flutter/material.dart';

class NoNetworkScreen extends StatelessWidget {
  const NoNetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        constraints:const BoxConstraints.expand(),
        decoration:const BoxDecoration(
          image: DecorationImage(
          image: AssetImage(AppImages.network),
          fit: BoxFit.fill
        )),
      ),
    );
  }
}