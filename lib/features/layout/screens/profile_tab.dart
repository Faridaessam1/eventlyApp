import 'package:evently_app/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class ProfileTab extends StatelessWidget{
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       children: [
         Container(
           padding: const EdgeInsets.all(16),
           height: MediaQuery.of(context).size.height * 0.27,
           decoration: BoxDecoration(
             color: AppColors.primaryColor,
               borderRadius: const BorderRadius.only(
                 bottomLeft: Radius.circular(70),
               ),
           ),
           child: Row(
             children: [
               Image.asset(
                 AppAssets.profileImage ,
                 height: MediaQuery.of(context).size.height * 0.2,
               ),
               Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Text("John Safwat" ,
                   style: TextStyle(
                     fontSize: 24,
                     fontWeight: FontWeight.w700,
                     color: AppColors.white
                   ),
                   ),
                   Text("johnsafwat.route@gmail.com",
                     style: TextStyle(
                         fontSize: 16,
                         fontWeight: FontWeight.w500,
                         color: AppColors.white
                     ),
                     softWrap: true,
                     overflow: TextOverflow.visible,
                   ),
                 ],
               )
             ],
           ),
           ),


       ],
     ),
    );

  }

}