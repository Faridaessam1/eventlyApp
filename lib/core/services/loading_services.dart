import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../theme/app_colors.dart';


void ConfigLoading() {
  EasyLoading.instance
  ..indicatorType = EasyLoadingIndicatorType.circle
  ..loadingStyle = EasyLoadingStyle.custom
  ..indicatorSize = 45.0
  ..radius = 10.0
  ..backgroundColor = AppColors.white
  ..indicatorColor = AppColors.primaryColorLight
  ..textColor = AppColors.white
  ..maskColor = Colors.black
  ..userInteractions = false
  ..dismissOnTap = false;
}