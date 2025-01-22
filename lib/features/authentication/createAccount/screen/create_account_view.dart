import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/routes/pages_route_name.dart';
import 'package:evently_app/core/theme/app_colors.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CreateAccountView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true ,
        title: Text(
            "Register"
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              AppAssets.eventlyLogo,
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04,),


            CustomTextFormField(iconPath: AppAssets.nameIcn, hintText:"Name"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02,),

            CustomTextFormField(iconPath: AppAssets.mailIcn, hintText:"Email"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02,),


            CustomTextFormField(iconPath: AppAssets.passwordIcn, hintText: "Password", isPassword: true,),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02,),


            CustomTextFormField(iconPath:AppAssets.passwordIcn, hintText: "Re-Password" , isPassword: true,),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06,),


            CustomElevatedButton(text: "Create Account", buttonColor: AppColors.primaryColor, textColor:AppColors.white),

            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Already Have An Account ? ",
                    style:Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.secondryColor,
                    ),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, PagesRouteName.signIN);
                      },
                      child: Text(
                        "LogIn",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),




            SizedBox(height: MediaQuery.of(context).size.height * 0.03,)
          ],
        ),
      ),
    );
  }

}