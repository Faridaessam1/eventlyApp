import 'package:evently_app/models/event_category.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomTabBarItem extends StatelessWidget{
EventCategory eventCategory;

  CustomTabBarItem({super.key, 
   required this.eventCategory,


});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: eventCategory.isSelected! ? (eventCategory.isHomeTab! ? AppColors.white : AppColors.primaryColorLight) : Colors.transparent,
          borderRadius: BorderRadius.circular(46),
          border: Border.all(
            color: eventCategory.isHomeTab! ?  AppColors.white : AppColors.primaryColorLight,
            width: 1,
          )
      ),
      child: Row(
        children: [
          Icon(eventCategory.eventCategoryIcon, color: eventCategory.isSelected! ? (eventCategory.isHomeTab! ? AppColors.primaryColorLight : AppColors.white) :(eventCategory.isHomeTab! ? AppColors.white : AppColors.primaryColorLight),),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
          Text(eventCategory.categoryName ,
            style: TextStyle(
              color: eventCategory.isSelected! ?( eventCategory.isHomeTab! ? AppColors.primaryColorLight : AppColors.white ) : (eventCategory.isHomeTab! ? AppColors.white : AppColors.primaryColorLight) ,
              fontWeight: FontWeight.w500,
              fontSize:16 ,
              fontFamily: "InterRegular",
            ),),
        ],
      ),
    );
  }

}