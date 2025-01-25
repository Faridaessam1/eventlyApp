import 'package:evently_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

import 'core/theme/app_theme_manager.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: AppThemeManager.lightData,
      navigatorKey: navigatorKey,

    );
  }
}