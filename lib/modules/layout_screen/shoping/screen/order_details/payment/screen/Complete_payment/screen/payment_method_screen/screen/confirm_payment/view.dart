import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/custom/custom_text_button.dart';
import 'package:e_commerce_code7x/custom/my_button.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/screen/order_details/screen/compelete_address/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/screen/order_details/screen/compelete_address/bloc/states.dart';
import 'package:e_commerce_code7x/modules/layout_screen/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../../../../../custom/my_text.dart';

class ConfirmPaymentScreen extends StatelessWidget {
  const ConfirmPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountryCubit, CountryStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = CountryCubit.get(context);
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state is PostAddressLoadingState)
              const Center(child: CircularProgressIndicator()),
                if (state is PostAddressSuccessState)
                  Column(
                    children: [
                      Image.asset('assets/images/Group.png'),
                      MyText(
                        text: cubit.postAddressModel!.data.orderId!,
                        margin: EdgeInsetsDirectional.only(top: 15.r),
                      ),
                      MyText(
                        text: 'يسعدنا ويشرفنا خدمتكم',
                        margin: EdgeInsetsDirectional.only(
                            top: 15.r, bottom: 15.r),
                      ),
                      MyButton(
                        height: 54.h,
                        width: 224.w,
                        borderRadius: BorderRadius.circular(15.r),
                        gradient: const LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Color(0xffCD4078),
                            Color(0xff6169B1),
                          ],
                        ),
                        onPressed: () {
                          navigateTo(context, const LayoutScreen());
                        },
                        text: 'Back to home page'.tr(),
                      ),
                      CustomTextButton(
                        text: 'View the order'.tr(),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        fontSize: 18.sp,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                if(state is PostAddressErrorState)
                      Column(
                    children: [
                      Image.asset('assets/images/faild.png'),
                      MyText(
                        text: 'The request has failed'.tr(),
                        margin: EdgeInsetsDirectional.only(top: 15.r),
                      ),
                      MyText(
                        text: 'There appears to be an error during your request'.tr(),
                        margin: EdgeInsetsDirectional.only(
                            top: 15.r, bottom: 15.r),
                      ),
                      MyButton(
                        height: 54.h,
                        width: 224.w,
                        borderRadius: BorderRadius.circular(15.r),
                        gradient: const LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Color(0xffCD4078),
                            Color(0xff6169B1),
                          ],
                        ),
                        onPressed: () {
                          Navigator.pop(context);

                        },
                        text: 'Try again'.tr(),
                      ),
                      CustomTextButton(
                        text: 'Back to home page'.tr(),
                        onPressed: () {
                          navigateTo(context, const LayoutScreen());
                        },
                        fontSize: 18.sp,
                        color: Colors.grey,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
