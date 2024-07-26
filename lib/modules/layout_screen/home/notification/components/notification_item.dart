import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../models/notification_model.dart';

class NotificationItem extends StatelessWidget {
  Data data;
   NotificationItem({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return     Container(
      margin: EdgeInsetsDirectional.all(10.r),
      padding: EdgeInsetsDirectional.all(15.r),
      width: double.infinity,
      height: 100.h,
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.black54),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // لون الظل
            spreadRadius: 5, // نطاق الانتشار
            blurRadius: 7, // نطاق الضبابية
            offset: Offset(0, 6), // الإزاحة (X, Y)
          ),
        ],

      ),

      child: Row(
        children: [


         Image.asset('assets/images/logo.png',height: 50.h,width: 50.w,),
          SizedBox(width: 10.w,),
          Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              MyText(text: data.title!),
              MyText(text: data.body!,color: Colors.black54,margin: EdgeInsetsDirectional.only(top: 5.r),),
            ],
          ),
        ],
      ),

    );
  }
}
