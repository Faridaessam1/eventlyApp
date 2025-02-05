import 'package:evently_app/core/theme/app_colors.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_assets.dart';
import '../../core/routes/pages_route_name.dart';
import '../../provider/app_language_provider.dart';
import '../../provider/theme_mode_provider.dart';

class OnBoardingView extends StatelessWidget{
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(AppAssets.onBoardingLogo , height: MediaQuery.of(context).size.height * 0.06,),
                  SizedBox(height: 10,),
                  Image.asset(AppAssets.onBoarding1 , height: MediaQuery.of(context).size.height * 0.5),
                  SizedBox(height: 15,),
            
                  Text( AppLocalizations.of(context)!.onBoardingView_title,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: AppColors.primaryColorLight,
                    )
                    ),
                  SizedBox(height: 20,),
            
                  Text(
                    AppLocalizations.of(context)!.onBoardingView_details,
                    style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black,
                          )
                      ),
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      Text( AppLocalizations.of(context)!.language,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: AppColors.primaryColorLight,
                          ),
                      ),
                      Spacer(),
                      Container(
                        width:75,
                        height: 30,
            
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.white,
                          border: Border.all(
                            color: AppColors.primaryColorLight,
                            width: 2,
                          ),
                        ),
            
            
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap:(){
                                if(languageProvider.appLanguage == "en") return;
                                languageProvider.changeAppLanguage("en");
                              },
                              child: Image.asset(AppAssets.ENLanguageIcn),
                            ),
                            Spacer(),
                        GestureDetector(
                          onTap: (){
                            if(languageProvider.appLanguage == "ar") return;
                            languageProvider.changeAppLanguage("ar");
                          },
                            child: Image.asset(AppAssets.ARLanguageIcn)),
                      ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text( AppLocalizations.of(context)!.theme,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: AppColors.primaryColorLight,
                          )
                      ),
                      Spacer(),
                      Container(
                        width:75,
                        height: 30,
            
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.white,
                          border: Border.all(
                            color: AppColors.primaryColorLight,
                            width: 2,
                          ),
                        ),
            
            
                        child: Row(
                          children: [
                        GestureDetector(
                          onTap:(){
                            if(themeProvider.appTheme == ThemeMode.light) return;
                            themeProvider.changeAppTheme(ThemeMode.light);
                          },
                            child: Image.asset(
                          AppAssets.lightMoodIcn,
                          color: AppColors.primaryColorLight,
                        )),
                        Spacer(),
                        GestureDetector(
                          onTap: (){
                            if(themeProvider.appTheme == ThemeMode.dark) return;
                            themeProvider.changeAppTheme(ThemeMode.dark);
                          },
                            child: Image.asset(AppAssets.darkMoodIcn)),
                      ],
                  ),
                )
                ],
            
              ),
                  SizedBox(height: 40,),
              CustomElevatedButton.text(
                  onPressed: (){
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      PagesRouteName.onBoardingDetails,
                          (route) => false,
                    );
                  },
                    text: AppLocalizations.of(context)!.letsstart,
                    buttonColor: AppColors.primaryColorLight,
                    textColor: AppColors.white,
                ),
            
            ]),
          ),
    )
      )
    );
  }


}