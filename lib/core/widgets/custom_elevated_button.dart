import 'package:flutter/material.dart';

import '../../main.dart';
import '../theme/app_colors.dart';

class CustomElevatedButton extends StatelessWidget{
  String? text;
  Color? buttonColor;
  Color? textColor;
  VoidCallback? onPressed;
  Widget? child;
  double? fontSize;
  double borderRadius;

  CustomElevatedButton({
    this.text,
   this.buttonColor,
     this.textColor,
    this.onPressed,
    this.child,
    this.fontSize = 20,
    this.borderRadius = 16,
  });

  CustomElevatedButton.text({
    required String text,
    required Color buttonColor,
    required Color textColor,
    VoidCallback? onPressed,
})
      : this(
    text: text,
    buttonColor: buttonColor,
    textColor: textColor,
    onPressed: onPressed,
  );

  CustomElevatedButton.iconText({
    required String text,
    required Color buttonColor,
    required Color textColor,
    VoidCallback? onPressed,
    required String iconImage,
})
  : this(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       Image.asset(iconImage, height: MediaQuery.of(navigatorKey.currentContext!).size.height * 0.03,),

        Text(text),
      ],
    ),
    textColor: textColor,
    buttonColor: buttonColor,
    text: text,
    onPressed: onPressed,

  );


  CustomElevatedButton.iconOnly({
    required Color buttonColor,
    required Image iconImage,
    VoidCallback? onPressed,
  }) : this(
    child: iconImage,
    buttonColor: buttonColor,
    onPressed: onPressed,
    text: null,
    textColor: null,
  );


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
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: (){},
      child:Text(text!,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w500 ,
          fontSize: fontSize,
          fontFamily: "InterRegular",
          color: textColor,

        ),
      ),

    );
  }
}
