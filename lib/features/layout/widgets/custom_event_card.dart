import 'package:evently_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';

class CustomEventCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18 , vertical: 9),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.25,
        width:  MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppAssets.eventlyCardBirthday),
          ),
          borderRadius: BorderRadius.circular(16),
        ),

        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: AppColors.pastelCyan,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Text("21 \n Nov",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontFamily: "InterRegular",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,

                  ),
                ),
              ),
            ),
            Spacer(),

            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.pastelCyan,
                borderRadius: BorderRadius.circular(10),

              ),
              child: Row(
                children: [
                  Text("This is a Birthday Party ",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      fontFamily: "InterRegular",
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.favorite, color: AppColors.primaryColor,)
                ],
              ),
            )

          ],
        ),

      ),
    );
  }

}