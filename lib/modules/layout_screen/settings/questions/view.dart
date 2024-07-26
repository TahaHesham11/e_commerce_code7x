import 'package:e_commerce_code7x/custom/Custom_Divider.dart';
import 'package:e_commerce_code7x/custom/custom_Drawer_list.dart';
import 'package:e_commerce_code7x/custom/custom_app_bar.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: MyText(
          text: 'اسئله متكرره',
          fontSize: 20.sp,
          color: Colors.teal,
        ),
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
                height: 200.h,
                width: 200.w,
                child: Image.asset('assets/images/questions.jpg')),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(

                      topLeft: Radius.circular(40.0.r),
                      topRight: Radius.circular(40.0.r),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, -3),
                        blurRadius: 8,
                        spreadRadius: 0,
                      ),
                    ],
                  ),

                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: MyText(
                              padding: EdgeInsetsDirectional.all(15.r),
                              text: 'من النصوص الاخري اضافه '
                                'الي زيادة عدد الحروف التي يولدها التطبيق',

                            ),
                          ),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.remove))
                        ],
                      ),
                      MyText(text:
                           ' هذا النص هو مثال لنص يمكن تغيره '
                         'هذا النص هو مثال لنص يمكن تغيره هذا النص هو مثال لنص يمكن تغيره'
                         ' هذا النص هو مثال لنص يمكن تغيره',
                      color: Colors.grey,
                        padding: EdgeInsetsDirectional.only(start:15.r,end: 10.r,bottom: 10.r),

                      ),
                      const CustomDivider(),

                      CustomDrawerList(
                        title: 'من النصوص الاخري اضافة الي زيادة؟',
                        trailing: IconButton(onPressed: (){},icon: const Icon(Icons.add),)
                      ),

                      const CustomDivider(),

                      CustomDrawerList(
                          title: 'من النصوص الاخري اضافة الي زيادة؟',
                          trailing: IconButton(onPressed: (){},icon: const Icon(Icons.add),)
                      ),
                      const CustomDivider(),

                      CustomDrawerList(
                          title: 'من النصوص الاخري اضافة الي زيادة؟',
                          trailing: IconButton(onPressed: (){},icon: const Icon(Icons.add),)
                      ),
                      const CustomDivider(),

                      CustomDrawerList(
                          title: 'من النصوص الاخري اضافة الي زيادة؟',
                          trailing: IconButton(onPressed: (){},icon: const Icon(Icons.add),)
                      ),
                    ],
                  ),



                ),
        
        
              ],
            )
        
          ],
        ),
      ),
    );
  }
}
