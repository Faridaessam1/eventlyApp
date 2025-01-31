import 'package:flutter/cupertino.dart';

class EventCategory{
String categoryName;
IconData eventCategoryIcon;
String eventCategoryImg;
bool? isSelected;
bool? isHomeTab;


EventCategory({
  required this.categoryName,
  required this.eventCategoryIcon,
  required this.eventCategoryImg,
  this.isSelected=true,
  this.isHomeTab=false,
});


}