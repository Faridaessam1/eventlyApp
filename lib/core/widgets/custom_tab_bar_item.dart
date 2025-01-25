import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomTabBarItem extends StatelessWidget{
  IconData icon;
  String text;
  bool isSelected;
  bool isHomeTab;


  CustomTabBarItem({
   required this.icon,
   required this.text,
    required this.isSelected,
    this.isHomeTab = true,


});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: isSelected ? (isHomeTab ? AppColors.white : AppColors.primaryColor) : Colors.transparent,
          borderRadius: BorderRadius.circular(46),
          border: Border.all(
            color: isHomeTab ?  AppColors.white : AppColors.primaryColor,
            width: 1,
          )
      ),
      child: Row(
        children: [
          Icon(icon, color: isSelected ? (isHomeTab ? AppColors.primaryColor : AppColors.white) :(isHomeTab ? AppColors.white : AppColors.primaryColor),),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
          Text(text ,
            style: TextStyle(
              color: isSelected ?( isHomeTab ? AppColors.primaryColor : AppColors.white ) : (isHomeTab ? AppColors.white : AppColors.primaryColor) ,
              fontWeight: FontWeight.w500,
              fontSize:16 ,
              fontFamily: "InterRegular",
            ),),
        ],
      ),
    );
  }

}