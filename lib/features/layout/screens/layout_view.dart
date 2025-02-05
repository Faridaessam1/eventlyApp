import 'package:evently_app/core/routes/pages_route_name.dart';
import 'package:evently_app/core/theme/app_colors.dart';
import 'package:evently_app/features/layout/screens/favorite_tab.dart';
import 'package:evently_app/features/layout/screens/home_tab.dart';
import 'package:evently_app/features/layout/screens/maps_tab.dart';
import 'package:evently_app/features/layout/screens/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int selectedIndex = 0 ;
  List<Widget> tabs = [
     HomeTab(),
     MapsTab(),
    SizedBox(),
     FavoriteTab(),
     ProfileTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(
          side: BorderSide(
            width: 5,
            color: AppColors.white
          )
        ),
        backgroundColor: AppColors.primaryColor,
        onPressed: (){
          Navigator.pushNamed(context, PagesRouteName.createEvent);
        },
        child: Icon(Icons.add,
          color: AppColors.white,
        ) ,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.white ,
        unselectedItemColor: AppColors.white,
        backgroundColor: AppColors.primaryColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: onBottomNavBarItemTapped,
        items:  [

          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon:Icon(Icons.home) ,
              label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            activeIcon:Icon(Icons.location_on) ,
            label: AppLocalizations.of(context)!.location,
          ),
          BottomNavigationBarItem(
            icon: SizedBox(),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            activeIcon:Icon(Icons.favorite) ,
            label: AppLocalizations.of(context)!.favorite,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3_outlined),
            activeIcon:Icon(Icons.person) ,
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
      ),
      body: tabs[selectedIndex],
    );
    }

  void onBottomNavBarItemTapped(int index){
    if(index == 2) return;
    selectedIndex = index;
    setState(() {

    });
  }
}
