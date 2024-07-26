import 'package:e_commerce_code7x/custom/custom_defaultField.dart';
import 'package:e_commerce_code7x/custom/default_button.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodScreen extends StatelessWidget {
  final paymentController = TextEditingController();
  final paypalController = TextEditingController();
   PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MyText(
          text: 'payment methods'.tr(),
        )
      ),
      
      body: Padding(
        padding:  EdgeInsets.all(8.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(text: 'Credit card'.tr()),


            Container(
              width: double.infinity,
              height: 77.h,
              margin: EdgeInsetsDirectional.symmetric(vertical: 20.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 3),
                    blurRadius: 8,
                    spreadRadius: 0,
                  ),
                ]
              ),
              child: CustomDefaultField(
                showBorder: false,

                suffixImage: Image.asset('assets/images/editpassword.png',),
                controller: paymentController,
                label: '125 512 189 952',
                fontColor: Colors.black,
                type: TextInputType.number,

                prefix: Padding(
                  padding: EdgeInsetsDirectional.only(end: 20.r),

                  child: Image.asset('assets/images/Group 89.png',

                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 77.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 3),
                    blurRadius: 8,
                    spreadRadius: 0,
                  ),
                ]
              ),
              child: CustomDefaultField(
                showBorder: false,

                suffixImage: Image.asset('assets/images/editpassword.png',),
                controller: paypalController,
                label: '125 512 189 952',
                fontColor: Colors.black,
                type: TextInputType.number,

                prefix: Padding(

                  padding: EdgeInsetsDirectional.only(end: 20.r),

                  child: Image.asset('assets/images/paypal.png',

                  ),
                ),
              ),
            ),
            Container(

              width: double.infinity,
              height: 77.h,
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 3),
                      blurRadius: 8,
                      spreadRadius: 0,
                    ),
                  ]
              ),
              child: MaterialButton(onPressed: (){},child: Row(
                children: [

                  IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                  MyText(text: 'Add a payment method'.tr(),),
                  Spacer(),
                  Image.asset('assets/images/apple_pay.png',),
                 Padding(
                     padding: EdgeInsetsDirectional.symmetric(horizontal: 5.r),
                     child: Image.asset('assets/images/amazone.png',)),
                  Image.asset('assets/images/apple_pay.png',),
              ],
              ),
              ),
            )
            // Container(
            //   margin: EdgeInsetsDirectional.only(top: 20.r),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(20.r),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.black.withOpacity(0.1),
            //         offset: const Offset(0, 3),
            //         blurRadius: 8,
            //         spreadRadius: 0,
            //       ),
            //     ]
            //   ),
            //   child: CustomDefaultField(
            //     showBorder: false,
            //
            //     suffixImage: Row(
            //       children: [
            //
            //
            //
            //
            //       ],
            //     ),
            //     controller: paypalController,
            //   //  label: 'Add a payment method'.tr(),
            //     fontColor: Colors.black,
            //     type: TextInputType.number,
            //
            //     prefix: Padding(
            //       padding: EdgeInsetsDirectional.only(end: 20.r),
            //
            //       child: IconButton(onPressed: (){},icon: Icon(Icons.add),),
            //
            //       ),
            //     ),
            //   ),





          ],
        ),
      ),
    );
  }
}
