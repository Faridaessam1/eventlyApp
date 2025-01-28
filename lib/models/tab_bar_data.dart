import 'package:flutter/material.dart';

class TabBarData{
  IconData icon;
  String tabName;
  bool isSelected;
  bool isHomeTab;

  TabBarData({
    required this.icon,
    required this.tabName,
    this.isSelected = true,
     this.isHomeTab = true,
});
}