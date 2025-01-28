import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/theme/app_colors.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_event_card.dart';

class FavoriteTab extends StatelessWidget{
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
                child: CustomTextFormField(
                  borderColor: AppColors.primaryColor,
                    iconPath: AppAssets.searchIcn,
                    iconColor: AppColors.primaryColor,
                    hintText: "Search For Event",
                    hintTextColor: AppColors.primaryColor,
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => const CustomEventCard(),
                  separatorBuilder:(context, index) => SizedBox(height: MediaQuery.of(context).size.height * 0.01,) ,
                  itemCount:5,
                ),
              ),
            ],
          ),
        ),
    );
  }

}