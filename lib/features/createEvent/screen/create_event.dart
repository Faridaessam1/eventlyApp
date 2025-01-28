import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_tab_bar_item.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/models/tab_bar_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  int SelectedIndex = 0;

  List<String> tabImages = [
    AppAssets.eventlyCardBookClub,
    AppAssets.eventlyCardSports,
    AppAssets.eventlyCardBirthday,
    AppAssets.eventlyCardMeeting,
    AppAssets.eventlyCardGaming,
    AppAssets.eventlyCardWorkShop,
    AppAssets.eventlyCardExhibition,
    AppAssets.eventlyCardHoliday,
    AppAssets.eventlyCardEating,
  ];


  @override
  Widget build(BuildContext context) {
    List<TabBarData> eventNameList = [
      TabBarData(
        icon: Icons.menu_book_outlined,
        tabName: "Book Club",

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

    return Scaffold(
      backgroundColor: AppColors.pastelCyan,
      appBar: AppBar(
        backgroundColor: AppColors.pastelCyan,
        centerTitle: true,
        title: Text(
          "Create Event",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w500, color: AppColors.primaryColor),
        ),
        iconTheme: IconThemeData(
          color: AppColors.primaryColor,
        ),
      ),
      body:  Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.27,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image:  DecorationImage(
                        fit: BoxFit.fill,
                        image:
                          AssetImage(tabImages[SelectedIndex]),

                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.height * 0.10,
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
                          labelPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01),
                        tabs: eventNameList.asMap().entries.map((entry) {
                          int index = entry.key;
                          var event = entry.value;

                          return CustomTabBarItem(
                            tabBarData: TabBarData(
                              tabName: event.tabName,
                              icon: event.icon,
                              isSelected: SelectedIndex == index,
                              isHomeTab:false,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const Text(
                    "Title",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "InterRegular",
                    ),
                  ),
                  CustomTextFormField(
                      iconPath: AppAssets.eventTitleIcon,
                      hintText: "Event Title"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "InterRegular",
                    ),
                  ),
                  CustomTextFormField(
                    hintText: "Description",
                    hasIcon: false,
                    minLines: 3,
                    maxLines: 6,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        "Event Date",
                        style: TextStyle(
                          fontFamily: "InterRegular",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Choose Date",
                          style: TextStyle(
                              fontFamily: "InterRegular",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time_outlined,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        "Event Time",
                        style: TextStyle(
                          fontFamily: "InterRegular",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Choose Time",
                          style: TextStyle(
                              fontFamily: "InterRegular",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Location",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "InterRegular",
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor
                          ),
                          onPressed: () {},
                          label: Icon(
                            Icons.my_location_outlined,
                              color: AppColors.white
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                        Text("Choose Event Location",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        ),
                        const Spacer(),
                        Icon(Icons.arrow_forward_ios, color: AppColors.primaryColor,)
                      ],
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.03,),

                  Row(
                    children: [
                      Expanded(child:
                      CustomElevatedButton.text(
                          text: "Add Event",
                          buttonColor: AppColors.primaryColor,
                          textColor:AppColors.white,
                      ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
    );
  }
}
