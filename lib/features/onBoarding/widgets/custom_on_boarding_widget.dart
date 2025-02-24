import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/routes/pages_route_name.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/on_boarding_data.dart';
import '../../../provider/app_language_provider.dart';
import '../../../provider/theme_mode_provider.dart';

class CustomOnBoardingWidget extends StatefulWidget {
  PageController pageController;
  OnBoardingData data;
  int currentPage;

  CustomOnBoardingWidget({
    super.key,
    required this.pageController,
    required this.data,
    required this.currentPage,
  });

  @override
  State<CustomOnBoardingWidget> createState() => _CustomOnBoardingWidgetState();
}

class _CustomOnBoardingWidgetState extends State<CustomOnBoardingWidget> {

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return SafeArea(
        child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(AppAssets.onBoardingLogo , height: MediaQuery.of(context).size.height * 0.06,),
                      SizedBox(height: 10,),
                      Image.asset(widget.data.img ,  height: MediaQuery.of(context).size.height * 0.5,),
                      SizedBox(height: 20,),

                      Text(widget.data.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: AppColors.primaryColorLight,
                          )
                      ),
                      SizedBox(height: 20,),

                      Text(widget.data.details,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          color: themeProvider.appTheme == ThemeMode.light ? Colors.black : AppColors.white,
                          )
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                         if (widget.currentPage > 0)
                         Align(
                              alignment: Alignment.bottomLeft,
                              child:IconButton(
                                onPressed:() {
                               widget.pageController.previousPage(
                               duration: Duration(milliseconds: 300),
                               curve: Curves.easeInOut,
                               );
                               },
                                icon: Icon(Icons.arrow_back_ios , color: AppColors.primaryColorLight),
                              ),
                            ),
                         Spacer(),

                         Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              onPressed:() {
                              if (widget.currentPage < onBoardingList.length - 1) {
                              widget.pageController.nextPage(
                             duration: Duration(milliseconds: 300),
                             curve: Curves.easeInOut,
                             );
                             } else{
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    PagesRouteName.layoutView,
                                (route) => false
                                );
                              }
                              },
                             icon: Icon(Icons.arrow_forward_ios , color: AppColors.primaryColorLight,),
                             ),
                            ),


                        ],
                      ),

                    ]
                ),
              ),
            )
    );
  }
}