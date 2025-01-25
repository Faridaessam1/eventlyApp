import 'package:evently_app/core/routes/pages_route_name.dart';
import 'package:evently_app/features/authentication/createAccount/screen/create_account_view.dart';
import 'package:evently_app/features/authentication/forgetPassword/screen/forget_password_view.dart';
import 'package:evently_app/features/authentication/signIN/screen/sign_in_view.dart';
import 'package:evently_app/features/createEvent/screen/create_event.dart';
import 'package:evently_app/features/layout/screens/layout_view.dart';
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
      case PagesRouteName.signIN:
        return MaterialPageRoute(
          builder: (context) => SignInView(),
          settings: settings,
        );
      case PagesRouteName.createAccount:
        return MaterialPageRoute(
          builder: (context) => CreateAccountView(),
          settings: settings,
        );
      case PagesRouteName.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => ForgetPasswordView(),
          settings: settings,
        );
      case PagesRouteName.layoutView:
        return MaterialPageRoute(
          builder: (context) => LayoutView(),
          settings: settings,
        );
      case PagesRouteName.createEvent:
        return MaterialPageRoute(
          builder: (context) => CreateEvent(),
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