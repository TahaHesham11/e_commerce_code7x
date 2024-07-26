import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatelessWidget {

  final String text;
  final String image;
  final double? width;
  final  void Function()? onPressed;
 const  DefaultButton({
   super.key,
   required this.text,
   required this.image,
    this.onPressed,
   this.width,
 });


  @override
  Widget build(BuildContext context) {
    return           Container(
      margin: EdgeInsetsDirectional.symmetric(horizontal: 20.r,vertical: 10.r),
      height: 45.h ,
      width: width??double.infinity ,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white70,
          border:Border.all(color: Colors.transparent),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 4,
              blurRadius: 5,
              offset: Offset(0, 3),
            )
          ]
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
        children: [

          Image.asset(image,width: 30.w,height: 30.h,),
          Padding(
            padding:  EdgeInsetsDirectional.only(start: 8.0.r),
            child: MyText(

                text:text,color: Colors.indigo,),
          ),
        ],
      ),
      ),
    );

  }
}
