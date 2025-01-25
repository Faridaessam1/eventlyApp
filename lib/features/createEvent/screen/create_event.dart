import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_tab_bar_item.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class CreateEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          child: DefaultTabController(
            length: 4,
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
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          AppAssets.eventlyCardBookClub,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.height * 0.10,
                    child: TabBar(
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      dividerColor: Colors.transparent,
                      indicatorColor: Colors.transparent,
                      tabs: [
                        CustomTabBarItem(
                          icon: CupertinoIcons.book,
                          text: "Book Club",
                          isSelected: true,
                          isHomeTab: false,
                        ),
                        CustomTabBarItem(
                          icon: CupertinoIcons.book,
                          text: "Book Club",
                          isSelected: false,
                          isHomeTab: false,
                        ),
                        CustomTabBarItem(
                          icon: CupertinoIcons.book,
                          text: "Book Club",
                          isSelected: false,
                          isHomeTab: false,
                        ),
                        CustomTabBarItem(
                          icon: CupertinoIcons.book,
                          text: "Book Club",
                          isSelected: false,
                          isHomeTab: false,
                        )
                      ],
                    ),
                  ),
                  Text(
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
                  Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "InterRegular",
                    ),
                  ),
                  CustomTextFormField(
                    hintText: "Description",
                    iconPath: AppAssets.eventTitleIcon,
                    minLines: 3,
                    maxLines: 6,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Event Date",
                        style: TextStyle(
                          fontFamily: "InterRegular",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
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
                      Icon(
                        Icons.access_time_outlined,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Event Time",
                        style: TextStyle(
                          fontFamily: "InterRegular",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
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
                  Text(
                    "Location",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "InterRegular",
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                  Container(
                    padding: EdgeInsets.all(8),
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
                        Spacer(),
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
        ),
    );
  }
}
