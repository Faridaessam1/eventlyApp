import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/extensions/center_ext.dart';
import 'package:evently_app/core/extensions/validation.dart';
import 'package:evently_app/core/routes/pages_route_name.dart';
import 'package:evently_app/core/theme/app_colors.dart';
import 'package:evently_app/core/utils/firebase_auth.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final formKey = GlobalKey<FormState>();
  final _emailControler = TextEditingController();
  final _passwordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.eventlyLogo,
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  CustomTextFormField(
                    controller: _emailControler,
                    iconPath: AppAssets.mailIcn,
                    hintText: "Email",
                    validator: (value){
                      if(value == null || value.trim().isEmpty ){
                        return " please Enter Your Email Address";
                      }
                      if(!Validations.validateEmail(value)){
                        return "Please Enter A Valid Email Address";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  CustomTextFormField(
                    controller: _passwordControler,
                    isPassword: true,
                    iconPath: AppAssets.passwordIcn,
                    hintText: "Password",
                    validator: (value){
                      if(value == null || value.trim().isEmpty ){
                        return " please Enter Your Password";
                      }
                      return null;
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, PagesRouteName.forgetPassword);
                      },
                      child: Text(
                        "Forget Password?",
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: AppColors.primaryColorLight,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryColorLight,
                          decorationThickness: 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  CustomElevatedButton.text(
                    text: "Login",
                    buttonColor: AppColors.primaryColorLight,
                    textColor: AppColors.white,
                    onPressed:() {
                      if(formKey.currentState!.validate()){
                        FirebaseFunctions.login(
                            _emailControler.text,
                            _passwordControler.text,
                        ).then((value){
                          EasyLoading.dismiss();
                          if(value == true){
                            Navigator.pushNamed(
                                context, PagesRouteName.layoutView);
                          }
                        });
                      }
                    } ,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't Have Account? ",
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: AppColors.secondryColorLight,
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
                                color: AppColors.primaryColorLight,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primaryColorLight,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColors.primaryColorLight,
                          thickness: 2,
                          indent: 20,
                          endIndent: 20,
                        ),
                      ),
                      Text(
                        "Or",
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: AppColors.primaryColorLight,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: AppColors.primaryColorLight,
                          thickness: 2,
                          indent: 20,
                          endIndent: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  CustomElevatedButton.iconText(
                    onPressed: () async {
                      UserCredential? userCredential = await FirebaseFunctions.signInWithGoogle();
                      if (userCredential != null) {
                        Navigator.pushNamed(context, PagesRouteName.layoutView);
                      } else{
                        Navigator.pushNamed(context, PagesRouteName.signIN);
                      }
                    },
                    text: "Login With Google",
                    buttonColor: AppColors.white,
                    textColor: AppColors.primaryColorLight,
                    iconImage: "assets/icons/googleIcon.png",
                  ),
                ],
              ).SetCenter(),
            ),
          ),
        ),
      ),
    );
  }
}
