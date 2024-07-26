import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDefaultField extends StatelessWidget {

 final TextEditingController?  controller;
final      String? label;
final      TextInputType type;
final     IconData? suffix;
final     Color? backGround;
final     double? fontSize;
final     double? width;
 final void Function()? onTap;
 final void Function()? suffixPressed;
final  Color? fontColor;
final  bool enable ;
final  TextAlign? textAlign;
final  bool? isPassword ;
final  Widget? suffixImage;
final   String? Function (String? value)? validate;
final  Widget? prefix;
final  TextInputAction? textInputAction;
final  InputDecoration? decoration;
final  Color? fillColor;
final  bool? filled;
final  BorderSide? borderSide;
final  bool showBorder;
final int maxLines;
 final void Function(String)? onSubmitted;
 final void Function(String)? onChanged;

   const CustomDefaultField({
    this.textAlign,
    super.key,
    this.controller,
    this.suffixImage,
    this.prefix,
     this.maxLines = 1,
    this.isPassword= false,
    this.showBorder=true,
    this.onTap,
    this.borderSide,
    this.suffixPressed,
    this.fontColor,
    this.fontSize,
    this.decoration,
    this.width,
    this.label,
    required this.type,
    this.backGround,
    this.enable=true,
    this.suffix,
    this.validate,
    this.textInputAction,
    this.fillColor,
    this.filled,
      this.onSubmitted,
      this.onChanged,
    });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.0.r,horizontal: 10.r),
      child: TextFormField(
        style: TextStyle(
          color: fontColor ?? Colors.black,
              fontSize: 13.sp,
        ),
        controller: controller,
        enabled:enable ,
        keyboardType: type,
        onChanged: onChanged,
        obscureText: isPassword??false,
        textInputAction: textInputAction,
        validator: validate,
        onTap: onTap,
        onFieldSubmitted: onSubmitted,
maxLines: maxLines,
        textAlign: textAlign??TextAlign.start,

        decoration:  InputDecoration(
          fillColor:fillColor?? Colors.white,

          filled: filled??true,
           prefixIcon: prefix,
            suffixIcon:  suffixImage,
            hintText: label,
            hintStyle: TextStyle(
                color:fontColor?? Colors.grey[400],
                fontSize:fontSize?? 14.sp,
            ),

          border: showBorder ? OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black38),
            borderRadius: BorderRadius.circular(10.r),
          ) : OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0.r),
          ),
        ),
        ),


    );
  }
}
