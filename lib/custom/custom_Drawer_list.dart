

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomDrawerList extends StatelessWidget {
 final  Widget? leadingIcon;
 final  String? title;
 final  Widget? trailing;
 final  Function()? onTap;
 final  Color? color;
 final  double? fontSize;
 final  FontWeight? fontWeight;
  const CustomDrawerList({
    this.title,
    this.color,
    this.fontSize,
    this.onTap,
    this.leadingIcon,
    this.trailing,
     this.fontWeight
  });

  @override
  Widget build(BuildContext context) {
    return    ListTile(
      leading: leadingIcon,
      title: Text(title!,style: TextStyle(
          fontSize: fontSize,
        fontWeight: fontWeight,
        color: color
      )).tr(),
      trailing: trailing ,
      onTap: onTap,
    );
  }
}
