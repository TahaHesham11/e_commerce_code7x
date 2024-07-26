import 'package:e_commerce_code7x/custom/custom_app_bar.dart';
import 'package:e_commerce_code7x/custom/my_button.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/notification/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/notification/bloc/states.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/notification/components/notification_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>NotificationCubit()..getNotification(),
      child: BlocConsumer<NotificationCubit,NotificationStates>(
        listener: (context, state) {},
        builder: (context, state) {

          var cubit = NotificationCubit.get(context);
          return  Scaffold(
            appBar:  CustomAppBar(

              text: MyText(
                text:'Notifications'.tr(),
                color: Colors.teal,
              ),
            ),

            body: BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                if (cubit.notificationModel == null) {
                  return const Center(child: CircularProgressIndicator(color: Colors.teal));
                }

                if (cubit.notificationModel!.data == null || cubit.notificationModel!.data!.isEmpty) {
                  return  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/bell.png'),
                        MyText(text: 'You have no notifications'.tr(),
                          margin: EdgeInsetsDirectional.symmetric(vertical: 20.r),),
                        MyButton(
                          borderRadius: BorderRadius.circular(25.r),
                          width: 180.w,
                          background: const Color(0xffD43D74),
                            onPressed: (){
                            },
                            text: 'Discover categories'.tr())
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return NotificationItem(data: cubit.notificationModel!.data![index]);
                  },
                  itemCount: cubit.notificationModel!.data!.length,
                );
              },
            )


          );
        },
      ),
    );
  }
}
