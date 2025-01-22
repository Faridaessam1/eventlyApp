import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/theme/app_colors.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true ,
        title: Text(
          "Forget Password"
        ),
      ),
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppAssets.forgetPassword),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10),
            child: CustomElevatedButton(text: "Reset Password", buttonColor:AppColors.primaryColor, textColor: AppColors.white),
          )
        ],
      ),
    );
  }

}