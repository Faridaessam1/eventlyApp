import 'package:evently_app/core/services/local_storage_keys.dart';
import 'package:evently_app/core/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/on_boarding_data.dart';
import '../../provider/app_language_provider.dart';
import '../../provider/theme_mode_provider.dart';
import 'widgets/custom_on_boarding_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnBoardingDetails extends StatefulWidget{
  @override
  State<OnBoardingDetails> createState() => _OnBoardingDetailsState();
}

class _OnBoardingDetailsState extends State<OnBoardingDetails> {

  PageController _pageController = PageController();
  int currentPage =0;

  @override
  void initState() {
   LocalStorageService.setBool(LocalStorageKeys.isFirstTimeRun, false);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView.builder(
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        controller: _pageController,
        itemCount: onBoardingList.length,
        itemBuilder: (BuildContext context, int index) {
          OnBoardingData data = onBoardingList[index];
          return CustomOnBoardingWidget(
            pageController: _pageController,
            data: data,
            currentPage: currentPage,
          );
        },
      ),

    );
  }
}

