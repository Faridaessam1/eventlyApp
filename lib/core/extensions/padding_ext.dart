import 'package:flutter/material.dart';

extension PaddingToWidget on Widget {
  Widget SetHorixontalPadding(BuildContext context, double value,
      {bool enableMediaQuery = true}) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: enableMediaQuery ? mediaQuery.size.width * value : value,
      ),
      child: this,
    );
  }


  Widget SetVerticalPadding(BuildContext context, double value,
      {bool enableMediaQuery = true}) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: enableMediaQuery ? mediaQuery.size.height * value : value,
      ),
      child: this,
    );
  }
}
