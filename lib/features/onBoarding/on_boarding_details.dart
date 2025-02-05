import 'package:flutter/material.dart';
import '../../models/on_boarding_data.dart';
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

