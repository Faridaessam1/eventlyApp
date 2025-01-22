import 'dart:async';

import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/routes/pages_route_name.dart';
import 'package:flutter/material.dart';

import '../onBoarding/on_boarding_view.dart';

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 2),
      () {
        Navigator.pushNamedAndRemoveUntil(
            context,
            PagesRouteName.signIN,
            (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.eventlyLogo,
              height: mediaQuery.size.height * 0.25,
            ),
          ],
        ),
      ),
    );
  }
}
