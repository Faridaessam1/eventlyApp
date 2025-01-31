import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/utils/firebase_firestore.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_tab_bar_item.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/models/event_category.dart';
import 'package:evently_app/models/event_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:evently_app/core/routes/pages_route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

import '../../../core/services/snack_bar_services.dart';
import '../../../core/theme/app_colors.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  int SelectedIndex = 0;
  DateTime? selectedDate;
  final formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionControler = TextEditingController();

  List<EventCategory> eventCategory = [
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                          eventCategory[SelectedIndex].eventCategoryImg),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.10,
                  child: DefaultTabController(
                    length: eventCategory.length,
                    child: TabBar(
                      onTap: (index) {
                        setState(() {
                          SelectedIndex = index;
                        });
                      },
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      dividerColor: Colors.transparent,
                      indicatorColor: Colors.transparent,
                      labelPadding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.01),
                      tabs: eventCategory.map((element) {
                        return CustomTabBarItem(
                          eventCategory: EventCategory(
                              categoryName: element.categoryName,
                              eventCategoryIcon: element.eventCategoryIcon,
                              eventCategoryImg: element.eventCategoryImg,
                              isSelected:
                                  SelectedIndex == eventCategory.indexOf(element),
                              isHomeTab: false),
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
                  controller: _titleController,
                    iconPath: AppAssets.eventTitleIcon,
                    hintText: "Event Title",
                ),
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
                  controller: _descriptionControler,
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
                      onPressed: () {
                        selectEventDate(context);
                      },
                      child: Text(
                        selectedDate != null
                            ? DateFormat("dd MMM yyy").format(selectedDate!)
                            : "Choose Date",
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
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
                            backgroundColor: AppColors.primaryColor),
                        onPressed: () {},
                        label: Icon(Icons.my_location_outlined,
                            color: AppColors.white),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Text(
                        "Choose Event Location",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.primaryColor,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton.text(
                        text: "Add Event",
                        buttonColor: AppColors.primaryColor,
                        textColor: AppColors.white,
                        onPressed: () {
                          var data = EventDataModel(
                              eventTitle: _titleController.text,
                              eventDescription: _descriptionControler.text,
                              eventImage: eventCategory[SelectedIndex].eventCategoryImg,
                              eventCategory: eventCategory[SelectedIndex].categoryName,
                              eventDate: selectedDate ?? DateTime.now(),
                          );
                          try{
                            if(formKey.currentState!.validate()){
                              if(selectedDate != null) {
                                EasyLoading.show();
                               FireBaseFirestore.createNewEvent(data).then((value){
                                });
                              }
                              SnackBarServices.showSuccessMessage("Event Created Successfully");
                              EasyLoading.dismiss();
                              Navigator.pushNamed(context, PagesRouteName.layoutView);

                            }
                          } catch(e){
                            SnackBarServices.showErrorMessage("An Error Occurred! Try Again");

                          }
                        },
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

  void selectEventDate(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 365),
      ),
    );

    if (newDate != null) {
      setState(() {
        selectedDate = newDate;
      });
    }
  }
}
