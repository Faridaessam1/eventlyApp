import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/routes/pages_route_name.dart';
import 'package:evently_app/core/theme/app_colors.dart';
import 'package:evently_app/core/utils/firebase_auth.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../core/extensions/validation.dart';

class CreateAccountView extends StatefulWidget{
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final formKey = GlobalKey<FormState>();
  final _nameControler = TextEditingController();
  final _emailControler = TextEditingController();
  final _passwordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true ,
        title: const Text(
            "Register"
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: formKey,

          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  AppAssets.eventlyLogo,
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
            
            
                CustomTextFormField(
                    iconPath: AppAssets.nameIcn,
                    hintText:"Name",
                  controller: _nameControler,
                  validator: (value){
                    if(value == null || value.trim().isEmpty ){
                      return " please Enter Your Name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
            
                CustomTextFormField(
                    iconPath: AppAssets.mailIcn,
                    hintText:"Email",
                  controller: _emailControler,
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
            
            
                CustomTextFormField(
                  iconPath: AppAssets.passwordIcn,
                  hintText: "Password",
                  isPassword: true,
                  controller: _passwordControler,
                  validator: (value){
                    if(value == null || value.trim().isEmpty ){
                      return " please Enter Your Password";
                    }
                    if(!Validations.validatePassword(value)){
                      return "Please Enter A Valid Password";
                    }
                    return null;
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
            
            
                CustomTextFormField(
                  iconPath:AppAssets.passwordIcn,
                  hintText: "Re-Password" ,
                  isPassword: true,
                  validator: (value){
                    if(value == null || value.trim().isEmpty ){
                      return " please Enter Your Password";
                    }
                    if(value != _passwordControler.text){
                      return "Password Not Matched";
                    }
                    return null;
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
            
            
                CustomElevatedButton.text(
                  text: "Create Account",
                  buttonColor:AppColors.primaryColorLight,
                  textColor: AppColors.white,
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                     FirebaseFunctions.createAccount(
                        _emailControler.text,
                        _passwordControler.text,
                      ).then((value){
                        EasyLoading.dismiss();
                        if(value == true){
                          navigatorKey.currentState!.pop();
                        }
                     }); // lw function createAccount de rg3t true yrg3 khatwa wara
                    }
                  },
                ),
            
            
            
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Already Have An Account ? ",
                        style:Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.secondryColorLight,
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
            
            
            
            
                SizedBox(height: MediaQuery.of(context).size.height * 0.03,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}