import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/custom/Custom_Divider.dart';
import 'package:e_commerce_code7x/custom/custom_Drawer_list.dart';
import 'package:e_commerce_code7x/custom/custom_defaultField.dart';
import 'package:e_commerce_code7x/custom/my_button.dart';
import 'package:e_commerce_code7x/modules/layout_screen/Categories/view.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/bloc/states.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/components/shopping_item.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/screen/order_details/payment/view.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/screen/order_details/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../custom/custom_app_bar.dart';
import '../../../../custom/my_text.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>ShoppingCubit()..getCartProduct(),
      child: Scaffold(
        appBar:CustomAppBar(
          text:MyText(
            text:'Shopping Cart'.tr(),
            color: Colors.teal,
            fontSize: 20.sp,

          ),


          isBack: false,
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
                    MyButton(onPressed: (){

                      navigateTo(context, const CategoryScreen());


                    }, text: 'Discover categories'.tr(),borderRadius: BorderRadius.circular(30.r),)
                  ],
                ),
              );
            } else {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => ShoppingItem(
                        userProduct: cubit.cartModel!.data!.items[index],
                        onPressed: () {
                          navigateTo(context, const OrderDetails());
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
                          Row(
                            children: [
                              Expanded(
                                flex:4,
                                child: CustomDefaultField(
                                  controller: cubit.codeController,
                                  type: TextInputType.number,
                                  label: 'اضافة كود',
                                  prefix: IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      'assets/images/credit.png',
                                      width: 25.w,
                                      height: 25.h,
                                    ),
                                  ),
                                  suffixImage: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios_rounded, size: 15.sp),
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: MyButton(
                                    margin: EdgeInsetsDirectional.only(end: 10.r),
                                    background: Colors.white,
                                      border: Border.all(color: Colors.teal),
                                      textColor: Colors.teal,
                                      width: 50.w,
                                      height: 45.h,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.white
                                        )
                                      ],
                                      onPressed: (){
                                      // cubit.postCode();
                                      }, text: 'نفعيل'),)
                            ],
                          ),
                          // MyText(
                          //   text: 'Order Details'.tr(),
                          //   fontSize: 20.sp,
                          //   fontWeight: FontWeight.bold,
                          //   margin: EdgeInsetsDirectional.only(top: 10.r, start: 15.r, bottom: 10.r),
                          // ),
                          CustomDrawerList(
                            title: 'total'.tr(),
                            color: Colors.grey,
                            trailing: MyText(
                              text: '${cubit.cartModel!.data!.total}',
                              fontSize: 12.sp,
                            ),
                          ),
                          // CustomDrawerList(
                          //   title: 'number pieces'.tr(),
                          //   color: Colors.grey,
                          //   trailing: MyText(
                          //     text: '${cubit.cartModel!.data!.totalItemsQuantity}',
                          //     fontSize: 12.sp,
                          //   ),
                          // ),
                          // CustomDrawerList(
                          //   title: 'DiscountCode'.tr(),
                          //   fontWeight: FontWeight.bold,
                          //   color: Colors.red,
                          //   trailing: MyText(
                          //     text: '${cubit.cartModel!.data!.totalDiscount}',
                          //     fontSize: 12.sp,
                          //     color: Colors.red,
                          //   ),
                          // ),

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
                               navigateTo(context,  PaymentScreen());

                              },
                              margin: EdgeInsetsDirectional.symmetric(vertical: 10.r),
                              text: 'Paying off'.tr(),
                              textColor: Colors.white,
                            ),
                          ),
                        ],
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
}
