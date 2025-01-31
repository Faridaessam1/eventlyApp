import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../theme/app_colors.dart';

class SnackBarServices {
  static void showSuccessMessage(String msg) {


    BotToast.showCustomNotification(
      duration: const Duration(seconds: 3), // Auto-dismiss after 3 seconds
      align: Alignment.topCenter,
      toastBuilder: (void Function() cancelFunc) { // cancelFunc 3shan notification tkhtfy b3d ma tkhls
        return Material(
          color: Colors.transparent, // notification background
          child: Container(
            width:  MediaQuery.of(navigatorKey.currentContext!).size.width * 0.9,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16), // space between msg and container
            margin: const EdgeInsets.only(top: 40), // message tb2a b3eda 3an el tarf
            decoration: BoxDecoration(
              color:Colors.green, // Background color for notification
              borderRadius:  BorderRadius.circular(10),

            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Purple Side Bar
                Container(
                  height: 30,
                  width: 6,
                  decoration: BoxDecoration(
                    color:Colors.green,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                ),
                const  SizedBox(width: 8), // Spacing between bar and text

                // Message Text
                Expanded(
                  child: Text(
                    msg,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis, // Handle long text gracefully
                  ),
                ),

              ],
            ),
          ),
        );
      },
      dismissDirections: [DismissDirection.startToEnd],
    );
    
  }

  static void showErrorMessage(String msg) {
    BotToast.showCustomNotification(
      duration: const Duration(seconds: 3),
      align: Alignment.topCenter,
      toastBuilder: (void Function() cancelFunc) {
        return Material(
          color: Colors.transparent,
          child: Container(
            width:  MediaQuery.of(navigatorKey.currentContext!).size.width * 0.9,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16), // space between msg and container
            margin: const EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: 6,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    msg,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      dismissDirections: [DismissDirection.startToEnd],
    );
  }
  
}
