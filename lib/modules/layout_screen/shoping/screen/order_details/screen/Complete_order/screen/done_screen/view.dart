import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/custom/Custom_Divider.dart';
import 'package:e_commerce_code7x/custom/custom_Drawer_list.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/modules/layout_screen/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoneScreen extends StatefulWidget {
  const DoneScreen({super.key});

  @override
  State<DoneScreen> createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {
  @override
  void initState() {
    super.initState();
    startDelayedAction(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:  Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(6.r)
                ),
                child: Image.asset('assets/images/right-arrow.png',height: 27.h,width: 27.w,))

        ),
        actions: [
          IconButton(onPressed: (){}, icon: MyText(text: 'حفظ',
            color: Colors.teal,fontSize: 20.sp,),),
        ],
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            MyText(text: 'تم الدفع بنجاح',color: Colors.teal,fontSize: 20.sp,),
            Stack(
              children: [
                SizedBox(
                  height: 300.h,
                  child: Container(
                    margin: EdgeInsetsDirectional.all(10.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
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
                        CustomDrawerList(
                          title: 'التاريخ',
                          color: Colors.grey,
                          trailing: MyText(
                            text: '1 may 2020',
                            fontSize: 12.sp,
                          ),
                        ),
                        CustomDrawerList(
                          title: 'طريقة الدفع',
                          color: Colors.grey,
                          trailing: MyText(
                            text: 'visa',
                            fontSize: 12.sp,
                          ),
                        ),
                        CustomDrawerList(
                          title: 'رقم المعاملة',
                          color: Colors.grey,
                          trailing: MyText(
                            text: '123456789',
                            fontSize: 12.sp,
                          ),
                        ),
                        CustomDrawerList(
                          title: 'مبلغ التحويل',
                          color: Colors.grey,
                          trailing: MyText(
                            text: '55,125 ر.س',
                            fontSize: 12.sp,
                          ),
                        ),
                        const CustomDivider(),
                        CustomDrawerList(
                          title: 'الكلي',
                          color: Colors.black,
                          trailing: MyText(
                            text: '11,125 رس',
                            fontSize: 12.sp,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),


              ],
            )

          ],
        ),
      ),
    );
  }

  void startDelayedAction(context) {
    Future.delayed(const Duration(seconds: 5), ()
    {
      navigateTo(context, const LayoutScreen());
    });
  }
}
