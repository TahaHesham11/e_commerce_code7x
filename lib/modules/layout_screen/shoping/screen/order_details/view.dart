import 'dart:developer';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/custom/Custom_Divider.dart';
import 'package:e_commerce_code7x/custom/custom_Drawer_list.dart';
import 'package:e_commerce_code7x/custom/custom_app_bar.dart';
import 'package:e_commerce_code7x/custom/custom_defaultField.dart';
import 'package:e_commerce_code7x/custom/my_button.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/models/address_model.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/bloc/states.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/screen/order_details/screen/compelete_address/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/screen/order_details/screen/compelete_address/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';


class OrderDetails extends StatefulWidget {
 const  OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: MyText(
          text:'Order Details'.tr(),
          fontSize: 20.sp,
          color: Colors.teal,
        ),
      ),

      body:  SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocConsumer<ShoppingCubit,ShoppingStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if(state is ShoppingLoadingState){
              return const Center(child: CircularProgressIndicator(color: Colors.teal,));
            }
            final cubit = ShoppingCubit.get(context);
            return Padding(
              padding:  EdgeInsets.all(12.0.r),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    MyText(text: 'Choose a title'.tr(),margin: EdgeInsetsDirectional.only(bottom: 10.r),),

                    BlocBuilder(
                      bloc: CountryCubit.get(context),
                      builder: (context, state) {
                        return CountryCubit.get(context).addressModel != null
                            ? CustomDropdown<AddressData>(
                           validator: (value) {
                             if (CountryCubit.get(context).addressModel == null || value == null || value.title!.isEmpty) {
                               return 'Please enter your address';
                             } else {
                               return null;
                             }
                           },
                          hintText: 'Choose the country'.tr(),
                          decoration: CustomDropdownDecoration(
                            closedBorder: Border.all(color: Colors.black),
                          ),
                          items: CountryCubit.get(context).addressModel!.data!,
                          listItemBuilder: (context, item, isSelected, onItemSelect) =>
                              Text(item.title!),
                          hintBuilder: (context, hint) {
                            return Text(hint);
                          },
                          headerBuilder: (context, selectedItem) {
                            return Text(selectedItem.title!);
                          },

                          onChanged: ( value) {
                            log('Selected country: ${value.title}');
                            log('hy: ${value.longitude},${value.latitude}');

                            CountryCubit.get(context).latLng = LatLng(double.parse(value.latitude!), double.parse(value.longitude!)) ;
                            log('////////////---------/////////: ${CountryCubit.get(context).latLng}');

                          },
                        )
                            : const Center(
                          child: CircularProgressIndicator(
                            color: Colors.teal,
                          ),
                        );
                      },
                    ),

                    Center(
                      child: MyButton(
                        width: double.infinity.w,
                        onPressed: (){

                          navigateTo(context,  const CompleteAddress());
                        },
                        margin: EdgeInsetsDirectional.symmetric(vertical: 20.r),
                        background: Colors.white70,
                        text: 'Add a new address'.tr(),
                        border: Border.all(color: Colors.teal),
                        textColor: Colors.teal,),
                    ),
                    MyText(text: 'Add your comments'.tr(),margin: EdgeInsetsDirectional.only(bottom: 5.r,top: 10.r),),


                    CustomDefaultField(

                      controller: cubit.messageController,

                      type:TextInputType.text ,
                      maxLines: 3,


                      validate: validate(text: 'comments '),

                    ),

                    Padding(

                      padding:  EdgeInsetsDirectional.only(top: 15.r),
                      child: Row(
                        children: [
                          Expanded(child: MyText(text: 'Choose installation data'.tr())),

                          Expanded(
                            child: CustomDefaultField(

                              label: '22/10/2020',
                              enable: true,
                              type: TextInputType.datetime,
                              controller: cubit.dateController,

                              onTap: (){

                                dismissKeyboard(context);
                                showDatePicker(

                                    context: context,
                                    firstDate: DateTime(2022, 8),
                                    lastDate: DateTime(2030)).then((value) {
                                  cubit.dateController.text=DateFormat.yMMMd().format(value!);
                                });


                              },
                            ),
                          )

                        ],
                      ),
                    ),


                    BlocBuilder(
                      bloc: cubit,
                      builder: (context, state) {
                        return cubit.cartModel !=null?Container(
                          margin: EdgeInsetsDirectional.only(top:20.r),
                          height: 450.h,
                          width: 350.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: const Offset(0, -3),
                                blurRadius: 8,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(text: 'Order Details'.tr(),fontSize: 20.sp,fontWeight: FontWeight.bold,
                                margin: EdgeInsetsDirectional.only(top: 10.r,start: 15.r,bottom: 10.r),),
                              CustomDrawerList(
                                title: 'total items'.tr(),
                                color: Colors.grey,
                                trailing: MyText(
                                  text: '${cubit.cartModel!.data!.totalItems}',
                                  fontSize: 12.sp,
                                ),
                              ),
                              CustomDrawerList(
                                title: 'number pieces'.tr(),
                                color: Colors.grey,
                                trailing: MyText(
                                  text: '${cubit.cartModel!.data!.totalItemsQuantity}',
                                  fontSize: 12.sp,
                                ),
                              ),
                              CustomDrawerList(
                                title: 'DiscountCode'.tr(),
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                trailing: MyText(
                                  text: '${cubit.cartModel!.data!.couponDiscount}',
                                  fontSize: 12.sp,
                                  color: Colors.red,
                                ),
                              ),


                              const CustomDivider(),
                              CustomDrawerList(
                                title: 'total discount'.tr(),
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                trailing: MyText(
                                  text: '${cubit.cartModel!.data!.totalDiscount}',
                                  fontSize: 12.sp,
                                  color: Colors.red,
                                ),
                              ),


                              CustomDrawerList(
                                title: 'totalSummation'.tr(),
                                fontWeight: FontWeight.bold,
                                trailing: MyText(
                                  text: '${cubit.cartModel!.data!.total}',
                                  fontSize: 12.sp,
                                ),
                              ),
                              CustomDrawerList(
                                title: 'payment'.tr(),
                                fontWeight: FontWeight.bold,
                                trailing: MyText(
                                  text: 'payment method'.tr(),
                                  fontSize: 12.sp,
                                ),
                              ),
                              Center(
                                child: MyButton(
                                  width: 300.w,
                                  onPressed: (){

                                    if (cubit.formKey.currentState!.validate()) {
                                      //   ScaffoldMessenger.of(context).showSnackBar(
                                      // SnackBar(
                                      //       content: MyText(text: 'Please complete the data'.tr()),
                                      //       backgroundColor: Colors.red,
                                      //       duration: const Duration(seconds: 5),
                                      //     ),
                                      //   );
                                      Navigator.pop(context);                                        }


                                  },


                                  margin: EdgeInsetsDirectional.symmetric(vertical: 10.r),
                                  background: Colors.white70,
                                  text: 'complete order'.tr(),
                                  border: Border.all(color: Colors.teal),
                                  textColor: Colors.teal,),
                              ),

                            ],
                          ),
                        ):const Center(child: CircularProgressIndicator(color: Colors.teal,));
                      },
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),

    );
  }

  static void dismissKeyboard(BuildContext context) => FocusScope.of(context).requestFocus(FocusNode());

}
