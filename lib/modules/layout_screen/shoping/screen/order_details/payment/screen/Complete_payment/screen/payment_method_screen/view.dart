import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/screen/order_details/payment/screen/Complete_payment/screen/payment_method_screen/components/payment_method_item.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/screen/order_details/payment/screen/Complete_payment/screen/payment_method_screen/screen/confirm_payment/view.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/screen/order_details/screen/compelete_address/bloc/states.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../../custom/custom_app_bar.dart';
import '../../../../../../../../../../custom/my_button.dart';
import '../../../../../../../../../../custom/my_text.dart';
import '../../../../../screen/compelete_address/bloc/cubit.dart';
import '../../../../components/time_line_item.dart';

class paymentMethodScreen extends StatefulWidget {
  const paymentMethodScreen({super.key});

  @override
  State<paymentMethodScreen> createState() => _paymentMethodScreenState();
}

class _paymentMethodScreenState extends State<paymentMethodScreen> {
bool isCheck =false;
late List<bool> isSelected;
@override
void initState() {
  super.initState();
  isSelected = List.generate(4, (index) => false);
}


bool isCurrentScreen = true; // حسب منطق الشاشة الحالية

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountryCubit,CountryStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = CountryCubit.get(context);
        return Scaffold(
          appBar: CustomAppBar(
              text:MyText(text: 'Paying off'.tr(),
                  fontSize: 20.sp
              )
          ),


          body:  Padding(
            padding:  EdgeInsets.all(12.0.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: TimeLineItem(

                          title: 'Address'.tr(),
                          isCompleted: true,
                          isFirst: true,
                          isLast: false,
                          isCurrentScreen: true,),
                      ),

                      Expanded(
                        flex: 2,
                        child: TimeLineItem(
                          title: 'Review the request'.tr(),
                          isCompleted: true,
                          isFirst: false,
                          isLast: false,
                          isCurrentScreen: true
                          ,),
                      ),

                      Expanded(
                        child: TimeLineItem(

                          title: 'Paying off'.tr(),
                          isCompleted: true,
                          isFirst: false,
                          isLast: true,
                          isCurrentScreen: false,
                        ),
                      ),
                    ],
                  ),
                ),

                MyText(text: 'Choose payment method'.tr(),margin: EdgeInsetsDirectional.only(bottom: 20.r),),

                PaymentMethodItem(text: 'Payment upon receipt'.tr(),
                  onChanged: (bool? value) {

                    setState(() {
                      isSelected[0] = value ?? false;
                      if (isSelected[0]) {
                        isSelected[1] = false;
                        isSelected[2] = false;
                        isSelected[3] = false;
                      }
                    });

                  },
                  isSelected: isSelected[0],
                ),
                PaymentMethodItem(text: 'Credit card'.tr(),
                  onChanged: (bool?value ) {

                    setState(() {
                      isSelected[1] = value ?? false;
                      if (isSelected[1]) {
                        isSelected[0] = false;
                        isSelected[2] = false;
                        isSelected[3] = false;
                      }
                    });
                  },
                  isSelected: isSelected[1],
                ),
                PaymentMethodItem(
                  text: 'Google'.tr(),
                  onChanged: (bool? value) {
                    setState(() {
                      isSelected[2] = value ?? false;
                      if (isSelected[2]) {
                        isSelected[0] = false;
                        isSelected[1] = false;
                        isSelected[3] = false;
                      }
                    });
                  },
                  isSelected: isSelected[2],
                ),
                PaymentMethodItem(
                  text: 'Add a payment method'.tr(),
                  onChanged: (bool? value) {
                    setState(() {
                      isSelected[3] = value ?? false;
                      if (isSelected[3]) {
                        isSelected[0] = false;
                        isSelected[1] = false;
                        isSelected[2] = false;
                      }
                    });
                  },
                  isSelected: isSelected[3],
                ),
                const Spacer(),
                Center(
                  child: MyButton(
                    borderRadius: BorderRadius.circular(30.r),

                    width: 300.w,
                    gradient: const LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        Color(0xffCD4078),
                        Color(0xff6169B1),

                      ],
                    ),
                    onPressed: () {
                      navigateTo(context, const ConfirmPaymentScreen());

                      cubit.postOrder();
                    },
                    margin: EdgeInsetsDirectional.symmetric(vertical: 10.r),
                    text: 'confirm'.tr(),
                    textColor: Colors.white,
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}
