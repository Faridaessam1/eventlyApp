import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/extensions/size_ext.dart';
import 'package:evently_app/core/theme/app_colors.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/features/layout/widgets/custom_event_card.dart';
import 'package:evently_app/core/widgets/custom_tab_bar_item.dart';
import 'package:evently_app/models/tab_bar_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int SelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<TabBarData> eventNameList = [
      TabBarData(
        icon: Icons.home,
        tabName: "All",

      ),
      TabBarData(
        icon: Icons.sports,
        tabName: "Sports",

      ),
      TabBarData(
        icon: Icons.settings_system_daydream,
        tabName: "BirthDay",

      ),
      TabBarData(
        icon: Icons.meeting_room_outlined,
        tabName: "Meeting",

      ),
      TabBarData(
        icon: Icons.games_outlined,
        tabName: "Gaming",

      ),
      TabBarData(
        icon: Icons.workspaces_outline,
        tabName: "WorkShop",

      ),
      TabBarData(
        icon: Icons.sports,
        tabName: "Exhibition",

      ),
      TabBarData(
        icon: Icons.holiday_village,
        tabName:  "Holiday",

      ),
      TabBarData(
        icon: Icons.fastfood_outlined,
        tabName: "Eating",

      ),

    ];

    return Column(
        children: [
          Container(
              padding: const EdgeInsets.all(16),
              height: MediaQuery.of(context).size.height * 0.27,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: const BorderRadius.only(
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
                            const SizedBox(
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
                        const Spacer(),
                        SvgPicture.asset(
                          AppAssets.sunIcn,
                          height: 0.04.height,
                        ),
                        const SizedBox(
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
                      child: DefaultTabController(
                        length: eventNameList.length,
                        child: TabBar(
                          onTap: (index){
                            SelectedIndex = index;
                            setState(() {});

                          },
                          isScrollable: true,
                          tabAlignment: TabAlignment.start,
                          dividerColor: Colors.transparent,
                          indicatorColor: Colors.transparent,
                          tabs: eventNameList.asMap().entries.map((entry) {
                            int index = entry.key;
                            var event = entry.value;

                            return CustomTabBarItem(
                              tabBarData: TabBarData(
                                tabName: event.tabName,
                                icon: event.icon,
                                isSelected: SelectedIndex == index,
                                isHomeTab: event.isHomeTab,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
                itemBuilder: (context, index) => const CustomEventCard(),
                separatorBuilder:(context, index) => SizedBox(height: MediaQuery.of(context).size.height * 0.01,) ,
                itemCount:5,
            ),
          ),
        ],
      );
  }
}
