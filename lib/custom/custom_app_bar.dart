import 'dart:math';

import 'package:e_commerce_code7x/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomAppBar extends StatelessWidget implements  PreferredSizeWidget {
  const CustomAppBar({
    Key? key, this.image,
    this.text,
    this.imageBack,
    this.backColor,
    this.height,
    this.width,
    this.backgroundColor,
    this.isAction=false,
    this.isBack = true,
    this.elevation=0.0,
    this.isImage=true
  }) : super(key: key);

  final Widget? imageBack;
  final bool isAction;
  final bool isBack;
  final Color? backColor;
  final Widget? image;
  final Widget? text;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final double elevation;
  final bool isImage ;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
scrolledUnderElevation: 0.0,

      automaticallyImplyLeading: false,
      elevation: elevation,
      backgroundColor: backgroundColor,

       leading: isBack ? IconButton(
         onPressed: () {
           Navigator.pop(context);
         },
         icon:  Container(
           child: CacheHelper.getData(key: 'lang') == 'en' ?  Transform.rotate(
               angle: pi,
               child: Image.asset('assets/images/iconredo.png',height: 27.h,width: 27.w,)):
           Image.asset('assets/images/iconredo.png',height: 27.h,width: 27.w,),
         ),

       ) : Container(),


      centerTitle: true,
      title: isImage ? text : Image.asset('assets/images/logo.png',width: 60.w,height: 60.h,),
    );
  }
}
