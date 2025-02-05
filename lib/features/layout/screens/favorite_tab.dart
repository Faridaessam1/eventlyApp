import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/theme/app_colors.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/utils/firebase_firestore.dart';
import '../../../models/event_data_model.dart';
import '../widgets/custom_event_card.dart';

class FavoriteTab extends StatefulWidget{
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
                child: CustomTextFormField(
                  borderColor: AppColors.primaryColorLight,
                    iconPath: AppAssets.searchIcn,
                    iconColor: AppColors.primaryColorLight,
                    hintText:AppLocalizations.of(context)!.search ,
                    hintTextColor: AppColors.primaryColorLight,
                ),
              ),
              StreamBuilder <QuerySnapshot<EventDataModel>>(
                stream:FireBaseFirestoreServices.getStreamFavoriteData(),
                builder: (context, snapshot) {
                  if(snapshot.hasError){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Something Went Wrong !",
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
                      itemBuilder: (context, index) =>  CustomEventCard(
                        eventData: eventDataList[index],
                      ),
                      separatorBuilder:(context, index) => SizedBox(height: MediaQuery.of(context).size.height * 0.01,) ,
                      itemCount:eventDataList.length,
                    ),
                  )
                      : Center(
                    child: Text("No Favorite Event Yet ! " ,
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
          ),
        ),
    );
  }
}