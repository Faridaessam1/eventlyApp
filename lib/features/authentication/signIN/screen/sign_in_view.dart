import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/extensions/center_ext.dart';
import 'package:evently_app/core/routes/pages_route_name.dart';
import 'package:evently_app/core/theme/app_colors.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.eventlyLogo,
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04,),

              CustomTextFormField(
                iconPath: AppAssets.mailIcn,
                hintText: "Email",
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02,),

              CustomTextFormField(
                isPassword: true,
                iconPath: AppAssets.passwordIcn,
                hintText: "Password",
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, PagesRouteName.forgetPassword);
                  },
                  child: Text(
                    "Forget Password?",
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor,
                      decorationThickness: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04,),

              CustomElevatedButton.text(text: "Login", buttonColor:AppColors.primaryColor, textColor: AppColors.white,),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02,),


              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Don't Have Account? ",
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: AppColors.secondryColor,
                      ),
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.baseline,
                      baseline: TextBaseline.alphabetic,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, PagesRouteName.createAccount);
                        },
                        child: Text(
                          "Create Account",
                          style: theme.textTheme.titleMedium?.copyWith(
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.02,),


              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColors.primaryColor,
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                    ),
                  ),
                  Text(
                    "Or",
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColors.primaryColor,
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02,),

              CustomElevatedButton.iconText(text: "Login With Google", buttonColor: AppColors.white, textColor:AppColors.primaryColor, iconImage:"assets/icons/googleIcon.png", ),


            ],
          ).SetCenter(),
        ),
      ),
    );
  }
}
