import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyText extends StatelessWidget {
  final  String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final TextAlign? textAlign;
  final AlignmentGeometry? alignment;
  final int? maxLine;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final bool? softWrap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? height;

  const MyText({
    super.key,
    required this.text,
    this.padding,
    this.decoration,
    this.margin,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.backgroundColor,
    this.textAlign,
    this.alignment,
    this.maxLine,
    this.overflow,
    this.softWrap = false,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return   Container(
      padding: padding,
      margin: margin,
      child: Text(

        text.tr(),

        maxLines: maxLine??50,
        softWrap: softWrap,
        overflow: overflow??TextOverflow.ellipsis,
        textAlign: textAlign,
        style: TextStyle(
          height: height??0,
            fontWeight: FontWeight.bold,
            fontSize: fontSize??15.sp,
            color: color,
          backgroundColor: backgroundColor,
          decoration: decoration,
        ),
      ),
    );
  }
}
