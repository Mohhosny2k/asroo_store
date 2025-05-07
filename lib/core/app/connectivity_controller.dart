import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityController {
  ConnectivityController._();

  static final ConnectivityController _instance = ConnectivityController._();
  static ConnectivityController get instance => _instance;

  Future<void> init() async {
    final result = await Connectivity().checkConnectivity();
    isInternetConnected(result);
    Connectivity().onConnectivityChanged.listen(isInternetConnected);
  }

  ValueNotifier<bool> isInternet = ValueNotifier(true);
  bool isInternetConnected(List<ConnectivityResult> results) {
    if (results == ConnectivityResult.none) {
      isInternet.value = false;
      return false;
    } else if (results == ConnectivityResult.mobile ||
        results == ConnectivityResult.wifi) {
      isInternet.value = true;
      return true;
    }
    return false;
  }
}
