import 'package:asroo_store/core/style/colors/colors_dark.dart';
import 'package:asroo_store/core/style/colors/colors_light.dart';
import 'package:flutter/material.dart';

import 'color_extension.dart';
import 'image_extension.dart';

ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsDark.mainColor,
    extensions:const <ThemeExtension<dynamic>>[MyColors.dark,MyImages.dark],
    useMaterial3: true,
  );

}

ThemeData themeLight() {
  return ThemeData(
   scaffoldBackgroundColor: ColorsLight.mainColor,
   extensions:const <ThemeExtension<dynamic>>[MyColors.light,MyImages.light],
    useMaterial3: true,
  );
  
}
