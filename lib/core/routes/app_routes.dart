import 'package:evently_app/core/routes/pages_route_name.dart';
import 'package:evently_app/features/splash/splash_view.dart';
import 'package:flutter/material.dart';

import '../../features/onBoarding/on_boarding_view.dart';

abstract class AppRoutes{

  static Route onGenerateRoute(RouteSettings settings){

    switch(settings.name){
      case PagesRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
          settings: settings,
        );
      case PagesRouteName.onBoarding:
        return MaterialPageRoute(
          builder: (context) => OnBoardingView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
          settings: settings,
        );
    }

  }
}