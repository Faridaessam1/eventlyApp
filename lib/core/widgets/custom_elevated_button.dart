import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomElevatedButton extends StatelessWidget{
  String text;
  Color buttonColor;
  Color textColor;

  CustomElevatedButton({
   required this.text,
    required this.buttonColor,
    required this.textColor,
});
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          padding: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: AppColors.primaryColor
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: (){},
      child:Text(text,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w500 ,
          fontSize: 20,
          fontFamily: "InterRegular",
          color: textColor,

        ),
      ),

    );
  }

}