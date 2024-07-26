import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/custom/custom_app_bar.dart';
import 'package:e_commerce_code7x/custom/custom_defaultField.dart';
import 'package:e_commerce_code7x/custom/my_button.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/models/country_model.dart';
import 'package:e_commerce_code7x/modules/layout_screen/settings/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/settings/bloc/states.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/screen/order_details/screen/compelete_address/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/screen/order_details/screen/compelete_address/bloc/states.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit, SettingStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = SettingCubit.get(context);
        var model = cubit.profileModel;

        if (model != null && model.data != null) {
          cubit.nameController.text = model.data!.fname ?? '';
          cubit.emailController.text = model.data!.email ?? '';
          cubit.phoneController.text = model.data!.phone ?? '';
          cubit.addressController.text = model.data!.country?.name ?? '';
        }

        return Scaffold(
          appBar: CustomAppBar(
            text: MyText(
              text: 'Account'.tr(),
              fontSize: 20.sp,
              color: Colors.teal,
            ),
          ),
          body: cubit.profileModel != null
              ? SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Color(0xffCD4078),
                            Color(0xff6169B1),
                          ],
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 42.r,
                        backgroundColor: Colors.transparent,
                        child: CircleAvatar(
                          radius: 40.r,
                          backgroundImage: cubit.profileImage == null
                              ? const AssetImage('assets/images/account.png')
                              : FileImage(cubit.profileImage!) as ImageProvider<Object>,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 15.r),
                      child: MyText(
                        text: 'Name'.tr(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: 5.0.r,
                        bottom: 15.r,
                      ),
                      child: CustomDefaultField(
                        controller: cubit.nameController,
                        type: TextInputType.name,
                        validate: validate(text: 'name'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 15.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MyText(
                            text: 'email'.tr(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: 5.0.r,
                        bottom: 15.r,
                      ),
                      child: CustomDefaultField(
                        controller: cubit.emailController,
                        type: TextInputType.emailAddress,
                        validate: validate(text: 'email'.tr()),
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 15.r),
                      child: MyText(
                        text: 'phone'.tr(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: 5.0.r,
                        bottom: 15.r,
                      ),
                      child: CustomDefaultField(
                        controller: cubit.phoneController,
                        type: TextInputType.phone,
                        validate: validate(text: 'phone'.tr()),
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 15.r),
                      child: MyText(
                        text: 'Address'.tr(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: 5.0.r,
                        bottom: 15.r,
                      ),
                      child: CustomDefaultField(
                        controller: cubit.addressController,
                        type: TextInputType.text,
                        validate: validate(text: 'address'.tr()),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: BlocBuilder<CountryCubit, CountryStates>(
                            builder: (context, state) {
                              return CountryCubit.get(context).countryModel != null
                                  ? CustomDropdown(
                                hintText: CountryCubit.get(context).countryModel!.data!.first.regions!.first.cities!.first.name,
                                decoration: CustomDropdownDecoration(
                                  closedBorder: Border.all(color: Colors.black),
                                ),
                                listItemBuilder: (context, item, isSelected, onItemSelect) => Text(item.name!),
                                hintBuilder: (context, hint) {
                                  return Text(hint);
                                },
                                headerBuilder: (context, selectedItem) {
                                  return Text(selectedItem.name!);
                                },
                                items: CountryCubit.get(context).countryModel!.data!.first.regions!.first.cities,
                                onChanged: (Cities? value) {
                                  CountryCubit.get(context).cities = value;
                                  log('${CountryCubit.get(context).cities!.name}: ${value!.name}');
                                },
                              )
                                  : const Center(child: CircularProgressIndicator(color: Colors.teal));
                            },
                          ),
                        ),
                        SizedBox(width: 5.w,),
                        Expanded(
                          child: BlocBuilder<CountryCubit, CountryStates>(
                            builder: (context, state) {
                              return CountryCubit.get(context).countryModel != null ? CustomDropdown(


                                hintText: CountryCubit.get(context).countryModel!.data!.first.regions!.first.cities!.first.districts!.first.name,
                                decoration: CustomDropdownDecoration(
                                  closedBorder: Border.all(color: Colors.black),
                                ),
                                listItemBuilder: (context, item, isSelected, onItemSelect) => Text(item.name!),
                                hintBuilder: (context, hint) {
                                  return Text(hint);
                                },
                                headerBuilder: (context, selectedItem) {
                                  return Text(selectedItem.name!);
                                },
                                items: CountryCubit.get(context).countryModel!.data!.first.regions!.first.cities!.first.districts,
                                onChanged: (Districts? value) {
                                  CountryCubit.get(context).districts = value;
                                  log('${CountryCubit.get(context).districts!.name}: ${value!.name}');
                                },
                              )
                                  : const Center(child: CircularProgressIndicator(color: Colors.teal));
                            },
                          ),
                        ),
                      ],
                    ),

                    MyText(text: 'Password'.tr(),margin: EdgeInsetsDirectional.only(top: 20.r,bottom: 10.r,start: 10.r,end: 10.r),),

                     CustomDefaultField(
                        type: TextInputType.visiblePassword,
                    controller: cubit.passwordController,
                       suffixImage: Image.asset('assets/images/editpassword.png'),
                    ),
                    MyButton(
                      borderRadius: BorderRadius.circular(20.r),
                      onPressed: () {
                        cubit.updateUserProfile();
                      },
                      margin: EdgeInsets.symmetric(horizontal: 15.r,vertical: 25.r),
                      width: double.infinity,
                      text: 'Save'.tr(),
                      textColor: Colors.white,

                    ),
                  ],
                )
              ],
            ),
          )
              : const Center(child: CircularProgressIndicator(color: Colors.teal)),
        );
      },
    );
  }
}
