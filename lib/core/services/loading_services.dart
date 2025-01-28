import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


void ConfigLoading() {
  EasyLoading.instance
  ..indicatorType = EasyLoadingIndicatorType.circle
  ..loadingStyle = EasyLoadingStyle.custom
  ..indicatorSize = 45.0
  ..radius = 10.0
  ..backgroundColor = Colors.white
  ..indicatorColor = Colors.red
  ..textColor = Colors.white
  ..maskColor = Colors.black
  ..userInteractions = false
  ..dismissOnTap = false;
}