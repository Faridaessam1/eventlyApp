import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class CustomTabBarItem extends StatelessWidget{
  IconData icon;
  String text;
  bool isSelected;


  CustomTabBarItem({
   required this.icon,
   required this.text,
    required this.isSelected,

});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: isSelected ? AppColors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(46),
          border: Border.all(
            color: AppColors.white,
            width: 1,
          )
      ),
      child: Row(
        children: [
          Icon(icon, color: isSelected ? AppColors.primaryColor : AppColors.white,),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
          Text(text ,
            style: TextStyle(
              color: isSelected ? AppColors.primaryColor : AppColors.white ,
              fontWeight: FontWeight.w500,
              fontSize:16 ,
              fontFamily: "InterRegular",
            ),),
        ],
      ),
    );
  }

}