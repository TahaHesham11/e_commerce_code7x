import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/bloc/states.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/components/shopping_item.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/screen/order_details/payment/components/time_line_item.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/screen/order_details/payment/screen/Complete_payment/screen/payment_method_screen/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import '../../../../../../../../custom/Custom_Divider.dart';
import '../../../../../../../../custom/custom_Drawer_list.dart';
import '../../../../../../../../custom/custom_app_bar.dart';
import '../../../../../../../../custom/my_button.dart';

class CompletePaymentScreen extends StatelessWidget {

 final String addressText = 'Review the request'.tr();
 bool isCurrentScreen = true; // حسب منطق الشاشة الحالية

 LatLng? latLng;
   CompletePaymentScreen({super.key,required this.latLng});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>ShoppingCubit()..getCartProduct(),
      child: Scaffold(
        appBar: CustomAppBar(
            text:MyText(text: addressText,fontSize: 20.sp,)
        ),

        body: BlocConsumer<ShoppingCubit, ShoppingStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = ShoppingCubit.get(context);

            if(state is ShoppingLoadingState ){
              return const Center(child: CircularProgressIndicator(color: Colors.teal,));
            }
            else if (cubit.cartModel == null || cubit.cartModel!.data == null || cubit.cartModel!.data!.items.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/carts_shop.png'),
                    MyText(text: 'The cart is empty'.tr(),margin: EdgeInsetsDirectional.symmetric(vertical: 15.r),),
                    MyButton(onPressed: (){}, text: 'Discover categories'.tr(),borderRadius: BorderRadius.circular(30.r),)
                  ],
                ),
              );
            } else {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [

                    // SizedBox(
                    //   height: 70.h,
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         child: TimeLineItem(
                    //
                    //             title: 'العنوان',
                    //             isCompleted: true),
                    //       ),
                    //
                    //       Expanded(
                    //         child: TimeLineItem(
                    //             title: 'مراجعة الطلب',
                    //             isCompleted: true),
                    //       ),
                    //
                    //       Expanded(
                    //         child: TimeLineItem(
                    //
                    //             title: 'الدفع', isCompleted: true),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    SizedBox(
                      height: 70.h,
                      child: Row(
                        children: [
                          Expanded(
                            child: TimeLineItem(
                              title: 'Address'.tr(),
                              isCompleted:true,
                              isFirst: true,
                              isLast: false,
                              isCurrentScreen: true,
                            ),
                          ),
                          Expanded(
                            flex: 2,

                            child: TimeLineItem(
                              title: 'Review the request'.tr(),
                              isCompleted: addressText == 'Review the request'.tr(),
                              isFirst: false,
                              isLast: false,
                              isCurrentScreen: false,
                            ),
                          ),
                          Expanded(
                            child: TimeLineItem(
                              title: 'Paying off'.tr(),
                              isCompleted: 'Paying off'.tr() == addressText,
                              isFirst: false,
                              isLast: true,
                              isCurrentScreen: false,
                            ),
                          ),
                        ],
                      ),
                    ),



                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => ShoppingItem(
                        isCheckCounter: false,
                        userProduct: cubit.cartModel!.data!.items[index],
                        onPressed: () {
                        },
                      ),
                      separatorBuilder: (context, index) => SizedBox(height: 10.h),
                      itemCount: cubit.cartModel!.data!.items.length,
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.all(15.r),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 4,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          CustomDrawerList(
                            title: 'total'.tr(),
                            color: Colors.grey,
                            trailing: MyText(
                              text: '${cubit.cartModel!.data!.total}',
                              fontSize: 12.sp,
                            ),
                          ),

                          CustomDrawerList(
                            title: 'discount'.tr(),
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            trailing: MyText(
                              text: '${cubit.cartModel!.data!.totalDiscount}',
                              fontSize: 12.sp,
                              color: Colors.red,
                            ),
                          ),
                          CustomDrawerList(
                            title: 'Shipping charges'.tr(),
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            trailing: MyText(
                              text: '${cubit.cartModel!.data!.shipping}',
                              fontSize: 12.sp,
                              color: Colors.red,
                            ),
                          ),

                          const CustomDivider(),
                          CustomDrawerList(
                            title: 'totalSummation'.tr(),
                            fontWeight: FontWeight.bold,
                            trailing: MyText(
                              text: '${cubit.cartModel!.data!.total}',
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),


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
                          navigateTo(context, const paymentMethodScreen());
                        },
                        margin: EdgeInsetsDirectional.symmetric(vertical: 10.r),
                        text: 'Paying off'.tr(),
                        textColor: Colors.white,
                      ),
                    ),

                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  // Widget buildStep(BuildContext context, int step, String title) {
  //   bool isActive = step == currentStep;
  //   return Row(
  //     children: [
  //       CircleAvatar(
  //         radius: 13.r,
  //
  //         backgroundColor: isActive ? Colors.purple : const Color(0xff7960A5),
  //         child: Text(
  //           step.toString(),
  //           style: TextStyle(fontSize:14.sp,color: isActive ? Colors.white : Colors.white),
  //         ),
  //       ),
  //       SizedBox(width: 4.w),
  //       Text(
  //         title,
  //         style: TextStyle(
  //           color: isActive ? Colors.purple : Colors.grey,
  //           fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
  //         ),
  //       ),
  //     ],
  //   );
  // }
  //
  //
  // Widget buildLine() {
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: 8.r),
  //     height: 1,
  //     width: 20,
  //     color: Colors.grey.shade300,
  //   );
  // }
}
