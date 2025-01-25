import 'package:flutter/material.dart';

extension CenterToWidet on Widget{

  Widget SetCenter(){
    return Center(
      child: this,
    );
  }
}