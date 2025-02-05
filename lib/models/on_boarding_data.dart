import 'package:evently_app/core/constants/app_assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../main.dart';


class OnBoardingData{
  String img;
  String title;
  String details;

  OnBoardingData({
    required this.img,
    required this.title,
    required this.details,
  });
}

List<OnBoardingData> onBoardingList=[
  OnBoardingData(
      img: AppAssets.onBoarding2,
    title: AppLocalizations.of(navigatorKey.currentContext!)!.onBoarding1_title,
    details: AppLocalizations.of(navigatorKey.currentContext!)!.onBoarding1_details,
  ),
  OnBoardingData(
      img: AppAssets.onBoarding3,
      title: AppLocalizations.of(navigatorKey.currentContext!)!.onBoarding2_title,
    details: AppLocalizations.of(navigatorKey.currentContext!)!.onBoarding2_details,
  ),
  OnBoardingData(
      img: AppAssets.onBoarding4 ,
    title: AppLocalizations.of(navigatorKey.currentContext!)!.onBoarding3_title,
    details: AppLocalizations.of(navigatorKey.currentContext!)!.onBoarding3_details,
  ),
];
