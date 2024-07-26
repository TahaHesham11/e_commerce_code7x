import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextButton extends StatelessWidget {

 final void  Function()? onPressed;
 final  String text;
 final  Color? color;
 final  double? fontSize;

  const CustomTextButton({
     super.key,
     required this.text,
     required this.onPressed,
     this.color,
     this.fontSize});

  @override
  Widget build(BuildContext context) {
    return   TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
           color: color??Colors.teal,
               fontSize: fontSize??25.0.sp,
          ),
        )
    );
  }
}




