import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/extensions/size_ext.dart';
import 'package:evently_app/core/theme/app_colors.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/features/layout/widgets/custom_event_card.dart';
import 'package:evently_app/features/layout/widgets/custom_tab_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(16),
              height: MediaQuery.of(context).size.height * 0.27,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  )),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Welcome Back",
                              style: TextStyle(
                                  fontFamily: "InterRegular",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "John Safwat",
                              style: TextStyle(
                                  fontFamily: "InterRegular",
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white),
                            ),
                          ],
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          AppAssets.sunIcn,
                          height: 0.04.height,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CustomElevatedButton.text(
                          text: "EN",
                          buttonColor: AppColors.white,
                          textColor: AppColors.primaryColor,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: AppColors.white,
                        ),
                        Text(
                          "Cairo , Egypt",
                          style: TextStyle(
                              fontFamily: "InterRegular",
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBar(
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        dividerColor: Colors.transparent,
                        indicatorColor: Colors.transparent,
                        tabs: [
                          Tab(
                            child: CustomTabBarItem(
                              icon: Icons.home,
                              text: "All",
                              isSelected: true,
                            ),
                          ),
                          Tab(
                            child: CustomTabBarItem(
                              icon: Icons.sports,
                              text: "Sports",
                              isSelected: false,
                            ),
                          ),
                          Tab(
                            child: CustomTabBarItem(
                              icon: Icons.sports,
                              text: "Sports",
                              isSelected: false,
                            ),
                          ),
                          Tab(
                            child: CustomTabBarItem(
                              icon: Icons.sports,
                              text: "Sports",
                              isSelected: false,
                            ),
                          ),
                          Tab(
                            child: CustomTabBarItem(
                              icon: Icons.sports,
                              text: "Sports",
                              isSelected: false,
                            ),
                          ),
                          Tab(
                            child: CustomTabBarItem(
                              icon: Icons.sports,
                              text: "Sports",
                              isSelected: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
                itemBuilder: (context, index) => CustomEventCard(),
                separatorBuilder:(context, index) => SizedBox(height: MediaQuery.of(context).size.height * 0.01,) ,
                itemCount:5,
            ),
          ),
        ],
      ),
    );
  }
}
