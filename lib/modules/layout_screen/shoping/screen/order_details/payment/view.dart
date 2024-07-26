import 'package:e_commerce_code7x/custom/custom_app_bar.dart';
import 'package:e_commerce_code7x/custom/my_button.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/screen/order_details/payment/components/details_addres_map.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/screen/order_details/payment/screen/Complete_payment/view.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/screen/order_details/screen/compelete_address/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/screen/order_details/screen/compelete_address/bloc/states.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import '../../../../../../core/validate.dart';
import '../screen/compelete_address/compoenets/map_item.dart';
import '../view.dart';
import 'package:latlong2/latlong.dart' as latlong;

import 'components/time_line_item.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int? selectedCheckboxIndex;

  @override
  void initState() {
    CountryCubit.get(context).marker.add(
          Marker(
            //  point:  widget.cubit!.selectedPoint! ,
            //point: widget.cubit!.latLng! ,

            point: const latlong.LatLng(31.037933, 31.381523),
            child: Icon(
              Icons.location_on,
              color: Colors.red,
              size: 40.0.sp,
            ),
          ),
        );
    super.initState();
  }
  String addressText = 'Address'.tr();
  bool isCurrentScreen = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        text: MyText(
          text: addressText,
            fontSize: 20.sp
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0.r),
        child: SingleChildScrollView(
          child: BlocConsumer<CountryCubit,CountryStates>(
            listener: (context, state) {},
            builder: (context, state) {
              final cubit = CountryCubit.get(context);
              return cubit.countryModel != null && cubit.addressModel != null ?
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                  height: 70.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: TimeLineItem(
                          title: addressText,
                          isCompleted: addressText == 'Address'.tr(),
                          isFirst: true,
                          isLast: false,
                          isCurrentScreen: false,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: TimeLineItem(
                          title: 'Review the request'.tr(),
                          isCompleted: 'Review the request'.tr() == addressText,
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


                  Container(
                      height: 300.h,
                      width: double.infinity,
                      margin: EdgeInsetsDirectional.only(bottom: 20.r,top: 20.r),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(0, 3),
                            blurRadius: 8,
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(0, -3),
                            blurRadius: 8,
                            spreadRadius: 0,
                          ),
                        ],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      child: MapItem(
                        //address:cubit.addressModel.data,
                        cubit: cubit,
                        isButton: false,

                      )),

                  Container(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: cubit.isCheckBox,
                          onChanged: (value){
                            setState(() {
                              cubit.isCheckBox = value!;

                            });
                          },
                          activeColor: Colors.teal,

                        ),
                        const MyText(text: 'Current Location')
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.symmetric(
                        vertical: 20.r, horizontal: 5.r),
                    padding: EdgeInsetsDirectional.all(10.r),
                    width: 416.w,
                    height: 200.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.3),
                          offset: const Offset(0, 3),
                          blurRadius: 8,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return DetailsAddress(
                          isChecked: selectedCheckboxIndex == index,
                          onCheckedChanged: (value) {
                            setState(() {
                              selectedCheckboxIndex = index;

                              cubit.latLng = LatLng(double.parse(cubit.addressModel!.data![index].latitude.toString()),
                                  double.parse(cubit.addressModel!.data![index].longitude.toString()));
                              //
                              //  cubit.latLng!.latitude=cubit.addressModel!.data![index].latitude;
                              // final longitude = cubit.addressModel!.data![index].longitude;
                              // final newLatLng = '$latitude,$longitude';

                              CountryCubit.get(context).updateLatLng();

                              //  print(newLatLng);
                            });
                          },
                          addressModel: cubit.addressModel!.data![index],
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 5.h),
                      itemCount: cubit.addressModel!.data!.length,
                    ),
                  ),


                  Container(
                    margin: EdgeInsetsDirectional.only(
                        start: 5.r, end: 5.r, top: 20.r, bottom: 20.r),
                    padding: EdgeInsetsDirectional.all(10.r),
                    width: 416.w,
                    height: 76.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.3),
                          offset: const Offset(0, 3),
                          blurRadius: 8,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const MyText(text: 'اضافة عنوان'),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            navigateTo(context, const OrderDetails());
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.teal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: MyButton(
                        width: 300.w,
                        borderRadius: BorderRadius.circular(30.r),
                        gradient: const LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Color(0xffCD4078),
                            Color(0xff6169B1),
                          ],
                        ),
                        onPressed: () {

                          navigateTo(context,  CompletePaymentScreen(latLng:  cubit.latLng,));
                        },
                        margin: EdgeInsetsDirectional.symmetric(vertical: 10.r),
                        text: 'Next'.tr(),
                        textColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ):const Center(child: CircularProgressIndicator(color: Colors.teal,));
            },
          ),
        ),
      ),
    );
  }
}
