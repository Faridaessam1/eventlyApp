import 'package:evently_app/core/theme/app_colors.dart';
import 'package:evently_app/core/utils/firebase_firestore.dart';
import 'package:evently_app/models/event_data_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_assets.dart';
import '../../../provider/theme_mode_provider.dart';

class CustomEventCard extends StatelessWidget{
  EventDataModel eventData;
   CustomEventCard({
    super.key,
  required this.eventData,
  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18 , vertical: 9),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.25,
        width:  MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(eventData.eventImage),
          ),
          borderRadius: BorderRadius.circular(16),
        ),

        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color:themeProvider.appTheme == ThemeMode.light ? AppColors.pastelCyan : AppColors.primaryColorDark,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Text("${eventData.eventDate.day} \n ${DateFormat('MMM').format(eventData.eventDate)}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: themeProvider.appTheme == ThemeMode.light ? AppColors.primaryColorLight : AppColors.primaryColorLight,
                    fontFamily: "InterRegular",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,

                  ),
                ),
              ),
            ),
            const Spacer(),

            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color:themeProvider.appTheme == ThemeMode.light ? AppColors.pastelCyan : AppColors.primaryColorDark,
                borderRadius: BorderRadius.circular(10),

              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(eventData.eventTitle,
                      style: TextStyle(
                        color: themeProvider.appTheme == ThemeMode.light ? AppColors.primaryColorLight : AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        fontFamily: "InterRegular",
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){
                      eventData.isFavorite = !eventData.isFavorite;
                      FireBaseFirestoreServices.updateEvent(eventData);
                    },
                    child: eventData.isFavorite ? Icon(
                      Icons.favorite,
                      color: AppColors.primaryColorLight,
                    ) : Icon(
                      Icons.favorite_border_outlined,
                      color: AppColors.primaryColorLight,
                    ),
                  ),
                ],
              ),
            )

          ],
        ),

      ),
    );
  }

}