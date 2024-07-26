import 'package:e_commerce_code7x/custom/Custom_Divider.dart';
import 'package:e_commerce_code7x/custom/custom_Drawer_list.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/custom/orders_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderItem extends StatelessWidget {

  final int? index;

  final OrderData orderData;

  const OrderItem({super.key, this.index,required this.orderData});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding:  EdgeInsets.all(12.0.r),
      child: Container(
        margin: EdgeInsetsDirectional.only(top: 20.r),
        decoration:  BoxDecoration(
          color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 4,
                blurRadius: 5,
                offset: Offset(0, 3),
              )
            ]
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.network( orderData.items!.first.product!.coverImage!,width: 100.w,height: 100.h,)),
                 Padding(
                   padding:  EdgeInsetsDirectional.only(start: 5.0.r),
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Row(
                        children: [
                           MyText(text: 'طلب',margin: EdgeInsetsDirectional.only(end: 5.r),),
                          MyText(text: orderData.orderId!),
                        ],
                      ),
                     MyText(text: orderData.items!.first.product!.basePrice!,color: Colors.teal,margin: EdgeInsetsDirectional.symmetric(vertical: 10.r),),
                      Row(
                        children: [
                          MyText(text: orderData.status!,margin: EdgeInsetsDirectional.only(end: 60.r),),
                           MyText(text: DateFormat('yyyy , MMMM , dd ').format(DateTime.parse(orderData.createdAt!)),)
                        ],
                      )
                    ],
                                   ),
                 ),


              ],
            ),
          ],
        ),
      ),
    );
  }
}


//
// Container(
// height: 380.h,
// width: 330.w,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10.r),
// color: Colors.white,
// border: Border.all(color: Colors.teal),
// boxShadow: [
// BoxShadow(
// color: Colors.black.withOpacity(0.3),
// offset: const Offset(0, 5,),
// blurRadius: 8,
// spreadRadius: 0,
// ),
// ],
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// MyText(text: 'Order Details'.tr(),fontSize: 20.sp,fontWeight: FontWeight.bold,
// margin: EdgeInsetsDirectional.only(top: 10.r,start: 15.r,bottom: 10.r),),
// CustomDrawerList(
// title: 'order number'.tr(),
// fontWeight: FontWeight.bold,
// trailing: MyText(
// text: '${orderData.orderId}',
// fontSize: 12.sp,
// color: Colors.purple,
// ),
// ),
// CustomDrawerList(
// title: 'Order status'.tr(),
// fontWeight: FontWeight.bold,
// trailing: MyText(
// text: orderData.status!,
// color: Colors.teal,
// fontSize: 12.sp,
// ),
// ),
// CustomDrawerList(
// title: 'NumberItem'.tr(),
// fontWeight: FontWeight.bold,
// trailing: MyText(
// text: '1',
// fontSize: 12.sp,
// color: Colors.grey,
// ),
// ),
// CustomDrawerList(
// title: 'Shipping'.tr(),
// color: Colors.red,
// trailing: MyText(
// text: '${orderData.shipping!}',
// fontSize: 12.sp,
// color: Colors.red,
//
// ),
// ),
// CustomDrawerList(
// title: 'DiscountCode'.tr(),
// fontWeight: FontWeight.bold,
// color: Colors.red,
// trailing: MyText(
// text:  '${orderData.discount!}',
// fontSize: 12.sp,
// color: Colors.red,
// ),
// ),
// const CustomDivider(),
//
// CustomDrawerList(
// title: 'totalSummation'.tr(),
// fontWeight: FontWeight.bold,
// trailing: MyText(
// text: '${orderData.total}',
// fontSize: 12.sp,
// ),
// ),
// ],
// ),
// );