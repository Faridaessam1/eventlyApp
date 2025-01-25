import 'package:evently_app/core/theme/app_colors.dart';
import 'package:evently_app/features/layout/screens/favorite_tab.dart';
import 'package:evently_app/features/layout/screens/home_tab.dart';
import 'package:evently_app/features/layout/screens/maps_tab.dart';
import 'package:evently_app/features/layout/screens/profile_tab.dart';
import 'package:flutter/material.dart';

class LayoutView extends StatefulWidget {
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
        onPressed: (){},
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
        items: const [

          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon:Icon(Icons.home) ,
              label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            activeIcon:Icon(Icons.location_on) ,
            label: "Maps",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            activeIcon:Icon(Icons.favorite) ,
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3_outlined),
            activeIcon:Icon(Icons.person) ,
            label: "Profile",
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
