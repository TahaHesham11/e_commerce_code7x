import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/modules/layout_screen/settings/my_order/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/settings/my_order/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:e_commerce_code7x/custom/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DetailsOrder extends StatelessWidget {
  final String orderId;
  final String status;
  const DetailsOrder({super.key,required this.orderId,required this.status});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit,OrderStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = OrderCubit.get(context);
        return  Scaffold(
          appBar:  CustomAppBar(

            text: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(text: 'طلب',margin: EdgeInsetsDirectional.only(end: 5.r),),
                MyText(text: orderId),
              ],
            ),
          ),
          body:   ListView(
            children: <Widget>[
              buildTimelineTile(
                context,
                title: 'تجهيز الطلب',
                hineText: ' طلب${orderId}تم التجهيز للتسليم ',
                isFirst: true,
                isLast: false,
                isCompleted: true,
              ),
              buildTimelineTile(
                context,
                title: status,
                hineText: 'طلبك في انتظار التاكيد , سوف يتم التاكيد خلال 5 دقائق',

                isFirst: false,
                isLast: false,
                isCompleted: cubit.ordersModel!.data!.data!.first.status == 'pending' ? true : false,
              ),
              buildTimelineTile(
                context,
                title: 'تم تأكيد',
                hineText: 'تم تاكيد طلبك . سوف يسلم قريبا',

                isFirst: false,
                isLast: false,
                isCompleted: cubit.ordersModel!.data!.data!.first.status == 'confirmed' ? true : false,
              ),
              buildTimelineTile(
                context,
                title: 'تم الشحن',
                hineText: 'تم تاكيد طلبك . سوف يسلم قريبا',

                isFirst: false,
                isLast: false,
                isCompleted: cubit.ordersModel!.data!.data!.first.status == 'shipping' ? true : false,
              ),
              buildTimelineTile(
                context,
                title: ' تم التوصيل',
                hineText: 'تم تاكيد طلبك . سوف يسلم قريبا',

                isFirst: false,
                isLast: true,
                isCompleted: cubit.ordersModel!.data!.data!.first.status == 'Delivered'  ? true : false,
              ),
            ],
          ),
        );
      },
    );
  }
  Widget buildTimelineTile(BuildContext context, {
    required String title,
    required String hineText,
    required bool isFirst,
    required bool isLast,
    required bool isCompleted,
  }) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.1,
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        width: 20.w,
        color: isCompleted ? Colors.pink : Colors.grey,
        iconStyle: IconStyle(
           fontSize: 20.sp,
          iconData: Icons.check,
          color: Colors.white,
        ),
      ),
      beforeLineStyle: LineStyle(
        color: isCompleted ? Colors.pink : Colors.grey,
        thickness: 2,
      ),
      afterLineStyle: LineStyle(
        color: isCompleted ? Colors.pink : Colors.grey,
        thickness: 2,
      ),
      endChild: Padding(
        padding:  EdgeInsets.all(16.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:  TextStyle(
                fontSize: 16.0.sp,
                color:  Colors.black ,
              ),
            ),
            Text(
              hineText,
              style:  TextStyle(
                fontSize: 14.0.sp,
                color:  Colors.grey ,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
