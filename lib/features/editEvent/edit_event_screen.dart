import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

import '../../core/constants/app_assets.dart';
import '../../core/routes/pages_route_name.dart';
import '../../core/services/snack_bar_services.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/firebase_firestore.dart';
import '../../core/widgets/custom_elevated_button.dart';
import '../../core/widgets/custom_tab_bar_item.dart';
import '../../core/widgets/custom_text_form_field.dart';
import '../../models/event_category.dart';
import '../../models/event_data_model.dart';

class EditEventScreen extends StatefulWidget{
  @override
  State<EditEventScreen> createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
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

  late EventDataModel eventData;
  late int selectedIndex;
  late DateTime? selectedDate;
  final formKey = GlobalKey<FormState>();

  late TextEditingController _eventTitleController;
  late TextEditingController _eventDescriptionController;
  late TextEditingController _eventImageController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // ana m7taga el context 3shan ast2bel el data
    // kan lazm a7othom fl build bs da hyba whesh llperformance
    // el function de btkhle fe zy context

    final args = ModalRoute.of(context)!.settings.arguments as Map;
    eventData = args["eventData"] as EventDataModel;
    selectedIndex = args["selectedIndex"] as int;

    _eventTitleController = TextEditingController(text: eventData.eventTitle);
    _eventDescriptionController = TextEditingController(text: eventData.eventDescription);
    _eventImageController = TextEditingController(text: eventData.eventImage);
    selectedDate = eventData.eventDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Event",
          style: TextStyle(
              color: AppColors.primaryColorLight
          ),
        ),
        iconTheme: IconThemeData(
          color: AppColors.primaryColorLight,
        ),
        actions: [
          GestureDetector(
              onTap: (){
                EasyLoading.show();
                FireBaseFirestoreServices.deleteEvent(eventData).then((value){
                  EasyLoading.dismiss();
                  if(value == true){
                    SnackBarServices.showSuccessMessage("Event Deleted Successfully");
                    Navigator.pushNamed(context, PagesRouteName.layoutView);
                  }else{
                    SnackBarServices.showErrorMessage("Your Event Not Deleted ! Try Again");
                  }
                });
              },
              child: Image.asset(
                AppAssets.deleteIcn,
                height: 30,
              )
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.27,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(_eventImageController.text),
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
                        selectedIndex = index;
                        _eventImageController.text = eventCategory[index].eventCategoryImg;
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
                            selectedIndex == eventCategory.indexOf(element),
                            isHomeTab: false),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),

              const Text(
                "Title",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "InterRegular",
                ),
              ),
              CustomTextFormField(
                controller: _eventTitleController,
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
                controller:_eventDescriptionController,
                hintText: "Description",
                hasIcon: false,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),

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
                          color: AppColors.primaryColorLight),
                    ),
                  ),
                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.02),

              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.primaryColorLight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColorLight),
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
                        color: AppColors.primaryColorLight,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.primaryColorLight,
                    )
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),

              Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton.text(
                      text: "Update Event",
                      buttonColor: AppColors.primaryColorLight,
                      textColor: AppColors.white,
                      onPressed: () {
                        try{
                          if(formKey.currentState!.validate()){
                            // Update the existing eventData object instead of creating new one
                            // This preserves the userID and other important fields
                            eventData.eventTitle = _eventTitleController.text;
                            eventData.eventDescription = _eventDescriptionController.text;
                            eventData.eventImage = eventCategory[selectedIndex].eventCategoryImg;
                            eventData.eventCategory = eventCategory[selectedIndex].categoryName;
                            eventData.eventDate = selectedDate ?? DateTime.now();

                            EasyLoading.show();
                            FireBaseFirestoreServices.updateEvent(eventData).then((value){
                              EasyLoading.dismiss();
                              if(value == true){
                                SnackBarServices.showSuccessMessage("Event Updated Successfully");
                                Navigator.pushNamed(context, PagesRouteName.layoutView);
                              }else{
                                SnackBarServices.showErrorMessage("Your Event Not Updated ! Try Again");
                              }
                            });
                          }
                        } catch(e){
                          SnackBarServices.showErrorMessage("An Error Occurred! Try Again");
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
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