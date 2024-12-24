import 'package:asroo_store/core/language/app_localizations.dart';
import 'package:asroo_store/core/style/theme/color_extension.dart';
import 'package:asroo_store/core/style/theme/image_extension.dart';
import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  ///color
  MyColors get color => Theme.of(this).extension<MyColors>()!;

///images 
MyImages get assets => Theme.of(this).extension<MyImages>()!;

//language

String translate(String langKey){
  return AppLocalizations.of(this)!.translate(langKey)!.toString();
}

  ///navigation
  Future<dynamic> push(Widget route) {
    return Navigator.of(this).push(MaterialPageRoute(builder: (context) => route));
}

  Future<dynamic> pushName(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  void pop() => Navigator.of(this).pop();
}
