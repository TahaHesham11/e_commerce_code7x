import 'package:e_commerce_code7x/custom/custom_app_bar.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/models/settings_model.dart';
import 'package:e_commerce_code7x/modules/layout_screen/settings/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/settings/bloc/states.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyScreen extends StatelessWidget {
   PrivacyScreen({super.key});
   DataPage? dataPage;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit,SettingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = SettingCubit.get(context);
        return Scaffold(
          appBar: CustomAppBar(
            text: MyText(
              text: 'Privacy'.tr(),
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
                    child: Image.asset('assets/images/privacy.jpg')),

                BlocBuilder(
                  bloc: cubit,
                  builder: (context, state) {
                    dataPage = cubit.settingModel!.data![1];
                    // يمكنك تغيير الفهرس حسب الحاجة
                    return cubit.settingModel != null ?
                    Stack(
                      children: [
                        SizedBox(
                          height: 300.h,
                          child: Container(
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


                          ),
                        ),

                        Padding(
                          padding:  EdgeInsets.all(15.0.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(text: 'Privacy'.tr(),
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                margin: EdgeInsetsDirectional.only(bottom: 10.r,top: 5.r),
                              ),
                               MyText(text: dataPage!.contentWithoutHtml!,
                                color: Colors.black54,
                               height: 2.h,
                               ),
                            ],
                          ),
                        ),



                      ],
                    ):const Center(child: CircularProgressIndicator(color: Colors.teal,));
                  },
                )
              ],
            ),
          ),

        );
      },
    );

  }
}
