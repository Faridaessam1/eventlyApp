import 'package:evently_app/core/routes/pages_route_name.dart';
import 'package:evently_app/features/authentication/createAccount/screen/create_account_view.dart';
import 'package:evently_app/features/authentication/forgetPassword/screen/forget_password_view.dart';
import 'package:evently_app/features/authentication/signIN/screen/sign_in_view.dart';
import 'package:evently_app/features/createEvent/screen/create_event.dart';
import 'package:evently_app/features/layout/screens/layout_view.dart';
import 'package:evently_app/features/onBoarding/on_boarding_details.dart';
import 'package:evently_app/features/splash/splash_view.dart';
import 'package:flutter/material.dart';

import '../../features/onBoarding/on_boarding_view.dart';

abstract class AppRoutes{

  static Route onGenerateRoute(RouteSettings settings){

    switch(settings.name){
      case PagesRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
      case PagesRouteName.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingView(),
          settings: settings,
        );
      case PagesRouteName.onBoardingDetails:
        return MaterialPageRoute(
          builder: (context) => OnBoardingDetails(),
          settings: settings,
        );
      case PagesRouteName.signIN:
        return MaterialPageRoute(
          builder: (context) => const SignInView(),
          settings: settings,
        );
      case PagesRouteName.createAccount:
        return MaterialPageRoute(
          builder: (context) => const CreateAccountView(),
          settings: settings,
        );
      case PagesRouteName.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgetPasswordView(),
          settings: settings,
        );
      case PagesRouteName.layoutView:
        return MaterialPageRoute(
          builder: (context) => const LayoutView(),
          settings: settings,
        );
      case PagesRouteName.createEvent:
        return MaterialPageRoute(
          builder: (context) => const CreateEvent(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
    }

  }
}