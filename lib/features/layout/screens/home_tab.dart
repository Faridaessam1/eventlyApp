import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/extensions/size_ext.dart';
import 'package:evently_app/core/theme/app_colors.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/features/layout/widgets/custom_event_card.dart';
import 'package:evently_app/core/widgets/custom_tab_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/firebase_firestore.dart';
import '../../../models/event_category.dart';
import '../../../models/event_data_model.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int SelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<EventCategory> eventCategory = [
      // EventCategory(
      //     categoryName: "All",
      //     eventCategoryIcon: Icons.all_out_outlined,
      //     eventCategoryImg: AppAssets.eventlyCardSports),
      EventCategory(
          categoryName: "Sports",
          eventCategoryIcon: Icons.sports,
          eventCategoryImg: AppAssets.eventlyCardSports),
      EventCategory(
          categoryName: "BirthDay",
          eventCategoryIcon: Icons.settings_system_daydream,
          eventCategoryImg: AppAssets.eventlyCardBirthday),
      EventCategory(
          categoryName: "Book Club",
          eventCategoryIcon: Icons.menu_book_outlined,
          eventCategoryImg: AppAssets.eventlyCardBookClub),
      EventCategory(
          categoryName: "Meeting",
          eventCategoryIcon: Icons.meeting_room_outlined,
          eventCategoryImg: AppAssets.eventlyCardMeeting),
      EventCategory(
          categoryName: "Gaming",
          eventCategoryIcon: Icons.games_outlined,
          eventCategoryImg: AppAssets.eventlyCardGaming),
      EventCategory(
          categoryName: "WorkShop",
          eventCategoryIcon: Icons.workspaces_outline,
          eventCategoryImg: AppAssets.eventlyCardWorkShop),
      EventCategory(
          categoryName: "Exhibition",
          eventCategoryIcon: Icons.sports,
          eventCategoryImg: AppAssets.eventlyCardExhibition),
      EventCategory(
          categoryName: "Holiday",
          eventCategoryIcon: Icons.holiday_village,
          eventCategoryImg: AppAssets.eventlyCardHoliday),
      EventCategory(
          categoryName: "Eating",
          eventCategoryIcon: Icons.fastfood_outlined,
          eventCategoryImg: AppAssets.eventlyCardEating),
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
                              "Farida Essam",
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
                        length: eventCategory.length,
                        child: TabBar(
                          onTap: (index){
                            SelectedIndex = index;
                            setState(() {});

                          },
                          isScrollable: true,
                          tabAlignment: TabAlignment.start,
                          dividerColor: Colors.transparent,
                          indicatorColor: Colors.transparent,
                          tabs: eventCategory.map((element) {
                            return CustomTabBarItem(
                              eventCategory: EventCategory(
                                  categoryName: element.categoryName,
                                  eventCategoryIcon: element.eventCategoryIcon,
                                  eventCategoryImg: element.eventCategoryImg,
                                  isSelected:  SelectedIndex == eventCategory.indexOf(element),
                                  isHomeTab:true,
                              ),
                            );
                          }).toList(),                      ),
                      ),
                    ),
                  ],
                ),
              )),

          //One time read
          // FutureBuilder(
          //     future: FireBaseFirestoreServices.getDataFromFirestore(eventCategory[SelectedIndex].categoryName),
          //     builder: (context, snapshot) {
          //       if(snapshot.hasError){
          //         return Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.stretch,
          //           children: [
          //             Text("Something Went Wrong !",
          //               style: TextStyle(
          //                 color: AppColors.secondryColor,
          //                 fontSize: 15,
          //                 fontWeight: FontWeight.w300,
          //               ),
          //             ),
          //             SizedBox(),
          //             IconButton(
          //                 onPressed: (){},
          //                 icon: Icon(Icons.refresh_outlined,
          //                   color: AppColors.secondryColor,
          //                 ),
          //             )
          //           ],
          //         );
          //       }
          //
          //       if(snapshot.connectionState == ConnectionState.waiting){
          //         return  Center(child: CircularProgressIndicator(
          //           color: AppColors.primaryColor,
          //         ));
          //       }
          //
          //       List<EventDataModel> eventDataList = snapshot.data ?? [];
          //
          //       return eventDataList.isNotEmpty ? Expanded(
          //         child: ListView.separated(
          //           padding: EdgeInsets.zero,
          //           itemBuilder: (context, index) =>  CustomEventCard(
          //             eventData: eventDataList[index],
          //           ),
          //           separatorBuilder:(context, index) => SizedBox(height: MediaQuery.of(context).size.height * 0.01,) ,
          //           itemCount:eventDataList.length,
          //         ),
          //       )
          //       : Center(
          //         child: Text("No Event Created Yet ! " ,
          //           style: TextStyle(
          //             color: AppColors.secondryColor,
          //             fontSize: 20,
          //             fontWeight: FontWeight.w400,
          //           ),
          //         ),
          //       )
          //       ;
          //
          //     },
          // ),

          //real time read


          StreamBuilder <QuerySnapshot<EventDataModel>>(
            stream:FireBaseFirestoreServices.getStreamData(eventCategory[SelectedIndex].categoryName),
            builder: (context, snapshot) {
              if(snapshot.hasError){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Something Went Wrong !",
                      style: TextStyle(
                        color: AppColors.secondryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(),
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.refresh_outlined,
                        color: AppColors.secondryColor,
                      ),
                    )
                  ],
                );
              }

              if(snapshot.connectionState == ConnectionState.waiting){
                return  Center(child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ));
              }

              List<EventDataModel> eventDataList = snapshot.data!.docs
                .map(
                  (element) {
                    return element.data();
                  },
                )
                .toList();

            return eventDataList.isNotEmpty ? Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) =>  CustomEventCard(
                    eventData: eventDataList[index],
                  ),
                  separatorBuilder:(context, index) => SizedBox(height: MediaQuery.of(context).size.height * 0.01,) ,
                  itemCount:eventDataList.length,
                ),
              )
                  : Center(
                child: Text("No Event Created Yet ! " ,
                  style: TextStyle(
                    color: AppColors.secondryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
              ;

            },
          ),
        ],
      );
  }
}
