import 'package:evently_app/core/constants/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CustomTextFormField extends StatefulWidget{
  String iconPath;
  String hintText;
  String Function(String?)? validator;
  bool isPassword;
  int? maxLines;
  int? minLines;


  CustomTextFormField({
    required this.iconPath,
    required this.hintText,
    this.validator,
    this.isPassword = false,
    this.maxLines = 1,
    this.minLines = 1,

});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      validator: widget.validator,
      obscureText: widget.isPassword ?? false ? obscureText : false,
      obscuringCharacter: "*",
      decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(9.0),
            child: ImageIcon(
              AssetImage(widget.iconPath),
              color: AppColors.secondryColor,
            ),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: AppColors.secondryColor,
            ),
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
          )
              : null,
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.secondryColor,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: AppColors.secondryColor,
              )
          ),
        focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: AppColors.secondryColor,
            )
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: Colors.red,
        )
    ),
      ),
    );
  }
}