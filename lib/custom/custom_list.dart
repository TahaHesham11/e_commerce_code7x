import 'dart:developer';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomList extends StatefulWidget {


 final List<String>? listItem;
  final EdgeInsets? padding;
  final EdgeInsetsGeometry? margin;
final  String? Function(String?)? validate;
  final String text;
 final BoxBorder? borderAll;
 final Color? fontColor;
 final Color? background;
  final double? fontSize;
final  double? height;
final  Widget Function(BuildContext, String)? headerBuilder;
 final Widget Function(BuildContext, String, bool, void Function())? listItemBuilder;

const  CustomList({
    super.key,
    required this.text,
    this.fontSize,
    this.padding,
     this.listItem,
    this.borderAll,
    this.fontColor,
    this.background,
    this.validate,
    this.height,
    this.margin,
    this.headerBuilder,
  this.listItemBuilder,
      });


  @override
  State<CustomList> createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      height: widget.height??50.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color:widget.background??Colors.grey[200],

      ),
      child: CustomDropdown<String>(

        items: widget.listItem,
        validator: widget.validate,
        headerBuilder: widget.headerBuilder,
        closedHeaderPadding: widget.padding??EdgeInsets.only(top: 7.r.r,bottom: 7.r, left: 2.r,right: 2.r),
        hintText: widget.text,
        decoration: CustomDropdownDecoration(
          closedBorder:widget.borderAll,
          closedBorderRadius: BorderRadius.circular(8.r),
          closedFillColor: Colors.transparent,
          headerStyle: TextStyle(fontSize: 11.sp),
          hintStyle: TextStyle(color:widget.fontColor?? Colors.grey[400],fontSize: widget.fontSize),

          closedSuffixIcon: Icon(
            Icons.arrow_drop_down_outlined,
            size: 30.r,
          ),
          expandedSuffixIcon: Icon(
            Icons.arrow_drop_up_outlined,
            size: 20.r,
          ),
        ),
        onChanged: (value) {
          log('changing value to: $value');
        },
      ),
    );
  }
}
