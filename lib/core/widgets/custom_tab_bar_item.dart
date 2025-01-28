import 'package:evently_app/models/tab_bar_data.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomTabBarItem extends StatelessWidget{
   TabBarData tabBarData;


  CustomTabBarItem({super.key, 
   required this.tabBarData


});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: tabBarData.isSelected ? (tabBarData.isHomeTab ? AppColors.white : AppColors.primaryColor) : Colors.transparent,
          borderRadius: BorderRadius.circular(46),
          border: Border.all(
            color: tabBarData.isHomeTab ?  AppColors.white : AppColors.primaryColor,
            width: 1,
          )
      ),
      child: Row(
        children: [
          Icon(tabBarData.icon, color: tabBarData.isSelected ? (tabBarData.isHomeTab ? AppColors.primaryColor : AppColors.white) :(tabBarData.isHomeTab ? AppColors.white : AppColors.primaryColor),),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
          Text(tabBarData.tabName ,
            style: TextStyle(
              color: tabBarData.isSelected ?( tabBarData.isHomeTab ? AppColors.primaryColor : AppColors.white ) : (tabBarData.isHomeTab ? AppColors.white : AppColors.primaryColor) ,
              fontWeight: FontWeight.w500,
              fontSize:16 ,
              fontFamily: "InterRegular",
            ),),
        ],
      ),
    );
  }

}