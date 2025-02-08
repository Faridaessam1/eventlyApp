import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/extensions/size_ext.dart';
import 'package:evently_app/core/routes/pages_route_name.dart';
import 'package:evently_app/core/theme/app_colors.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/features/layout/widgets/custom_event_card.dart';
import 'package:evently_app/core/widgets/custom_tab_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/firebase_firestore.dart';
import '../../../models/event_category.dart';
import '../../../models/event_data_model.dart';
import '../../../provider/app_language_provider.dart';
import '../../../provider/theme_mode_provider.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int SelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    List<EventCategory> eventCategory = [
      EventCategory(
          categoryName: AppLocalizations.of(context)!.all,
          eventCategoryIcon: Icons.all_out_outlined,
          eventCategoryImg: AppAssets.eventlyCardSports),
      EventCategory(
          categoryName: AppLocalizations.of(context)!.sports,
          eventCategoryIcon: Icons.sports,
          eventCategoryImg: AppAssets.eventlyCardSports),
      EventCategory(
          categoryName:AppLocalizations.of(context)!.birthday ,
          eventCategoryIcon: Icons.settings_system_daydream,
          eventCategoryImg: AppAssets.eventlyCardBirthday),
      EventCategory(
          categoryName: AppLocalizations.of(context)!.bookclub,
          eventCategoryIcon: Icons.menu_book_outlined,
          eventCategoryImg: AppAssets.eventlyCardBookClub),
      EventCategory(
          categoryName: AppLocalizations.of(context)!.meeting,
          eventCategoryIcon: Icons.meeting_room_outlined,
          eventCategoryImg: AppAssets.eventlyCardMeeting),
      EventCategory(
          categoryName:AppLocalizations.of(context)!.gaming,
          eventCategoryIcon: Icons.games_outlined,
          eventCategoryImg: AppAssets.eventlyCardGaming),
      EventCategory(
          categoryName: AppLocalizations.of(context)!.workshop,
          eventCategoryIcon: Icons.workspaces_outline,
          eventCategoryImg: AppAssets.eventlyCardWorkShop),
      EventCategory(
          categoryName: AppLocalizations.of(context)!.exhibition,
          eventCategoryIcon: Icons.sports,
          eventCategoryImg: AppAssets.eventlyCardExhibition),
      EventCategory(
          categoryName: AppLocalizations.of(context)!.holiday,
          eventCategoryIcon: Icons.holiday_village,
          eventCategoryImg: AppAssets.eventlyCardHoliday),
      EventCategory(
          categoryName:AppLocalizations.of(context)!.eating,
          eventCategoryIcon: Icons.fastfood_outlined,
          eventCategoryImg: AppAssets.eventlyCardEating),
    ];

    return Column(
        children: [
          Container(
              padding: const EdgeInsets.all(16),
              height: MediaQuery.of(context).size.height * 0.27,
              decoration: BoxDecoration(
                  color: themeProvider.appTheme == ThemeMode.light ? AppColors.primaryColorLight : AppColors.primaryColorDark,
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
                              AppLocalizations.of(context)!.welcomeback,
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
                        GestureDetector(
                          onTap: (){
                            if(themeProvider.appTheme == ThemeMode.light){
                              themeProvider.changeAppTheme(ThemeMode.dark);
                            } else{
                              themeProvider.changeAppTheme(ThemeMode.light);
                            }
                          },
                          child: SvgPicture.asset(
                            AppAssets.sunIcn,
                            height: 0.04.height,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomElevatedButton.text(
                          text: languageProvider.appLanguage == "en" ? "EN" : "AR",
                          buttonColor: AppColors.white,
                          textColor: AppColors.primaryColorLight,
                          onPressed: () {
                            if(languageProvider.appLanguage == "en"){
                              languageProvider.changeAppLanguage('ar');
                            }else{
                              languageProvider.changeAppLanguage('en');
                            }

                          },
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
                    Text(AppLocalizations.of(context)!.somethingWentWrong,
                      style: TextStyle(
                        color: AppColors.secondryColorLight,
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(),
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.refresh_outlined,
                        color: AppColors.secondryColorLight,
                      ),
                    )
                  ],
                );
              }

              if(snapshot.connectionState == ConnectionState.waiting){
                return  Center(child: CircularProgressIndicator(
                  color: AppColors.primaryColorLight,
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
                  itemBuilder: (context, index) =>  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(
                              context, PagesRouteName.editEvent,
                        arguments: {
                          "eventData": eventDataList[index],
                          "selectedIndex": index
                        },

                      );


                        },
                    child: CustomEventCard(
                      eventData: eventDataList[index],
                    ),
                  ),
                  separatorBuilder:(context, index) => SizedBox(height: MediaQuery.of(context).size.height * 0.01,) ,
                  itemCount:eventDataList.length,
                ),
              )
                  : Center(
                child: Text(AppLocalizations.of(context)!.noeventcreated ,
                  style: TextStyle(
                    color: AppColors.secondryColorLight,
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
