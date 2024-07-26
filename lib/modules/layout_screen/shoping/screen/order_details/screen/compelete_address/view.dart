import 'dart:developer';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/custom/custom_app_bar.dart';
import 'package:e_commerce_code7x/custom/custom_defaultField.dart';
import 'package:e_commerce_code7x/custom/my_button.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/models/country_model.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/screen/order_details/screen/compelete_address/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/screen/order_details/screen/compelete_address/bloc/states.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/screen/order_details/screen/compelete_address/compoenets/map_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CompleteAddress extends StatefulWidget {
  const CompleteAddress({super.key});

  @override
  State<CompleteAddress> createState() => _CompleteAddressState();
}

class _CompleteAddressState extends State<CompleteAddress> {

bool isCheckBox = false;
bool countrySelected = true;
bool regionSelected = true;
bool citySelected = true;
bool districtSelected = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: MyText(
          text: "Add a new address".tr(),
        ),
      ),

      body: BlocConsumer<CountryCubit,CountryStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if(state is CountryLoadingStates){
            return const Center(child: CircularProgressIndicator(color: Colors.teal,));
          }

          final cubit = CountryCubit.get(context);
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding:  EdgeInsets.all(12.0.r),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      margin: EdgeInsetsDirectional.only(start: 10.r, top: 10.r),
                      text: 'Title name'.tr(),

                    ),


                    CustomDefaultField(

                      controller: cubit.nameAddressController,

                      type:TextInputType.text ,

                      validate: validate(text: 'name address'),

                    ),

                    MyText(
                      margin: EdgeInsetsDirectional.only(start: 10.r,top: 10.r),
                      text: 'Address in details'.tr(),

                    ),
                    Padding(
                      padding:  EdgeInsetsDirectional.only(bottom: 20.0.r),
                      child: CustomDefaultField(
                        type: TextInputType.text,
                        maxLines: 3,
                        controller: cubit.detailsAddressController,
                        validate: validate(text: 'details address'),
                        decoration: InputDecoration(
                          hintText: 'Write address'.tr() ,
                          hintStyle: TextStyle(fontSize: 12.sp),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r)
                          ),
                        ),
                      ),
                    ),


              // Column(
              //   children: [
              //     BlocBuilder<CountryCubit, CountryStates>(
              //       bloc: cubit,
              //       builder: (context, state) {
              //         return cubit.countryModel != null
              //             ? CustomDropdown<DataCountry>(
              //           hintText: 'Choose the country'.tr(),
              //           validator: (value) {
              //             if (cubit.countryModel == null || value == null) {
              //               return 'Please choose the country';
              //             } else {
              //               return null;
              //             }
              //           },
              //           decoration: CustomDropdownDecoration(
              //               closedBorder: Border.all(color: Colors.black)),
              //           listItemBuilder: (context, item, isSelected, onItemSelect) =>
              //               Text(item.name!),
              //           hintBuilder: (context, hint) {
              //             return Text(hint);
              //           },
              //           headerBuilder: (context, selectedItem) {
              //             return Text(selectedItem.name!);
              //           },
              //           items: cubit.countryModel!.data!,
              //           onChanged: (DataCountry? value) {
              //             cubit.updateCountry(value!);
              //             log('${cubit.country!.name}: $value');
              //           },
              //         )
              //             : const Center(child: CircularProgressIndicator(color: Colors.teal));
              //       },
              //     ),
              //     if (cubit.country != null)
              //       Padding(
              //         padding: EdgeInsetsDirectional.symmetric(vertical: 20.r),
              //         child: BlocBuilder<CountryCubit, CountryStates>(
              //           bloc: cubit,
              //           builder: (context, state) {
              //             return CustomDropdown<Regions>(
              //               hintText: 'Choose the region'.tr(),
              //               validator: (value) {
              //                 if (cubit.regions == null) {
              //                   return 'Please choose the region';
              //                 } else {
              //                   return null;
              //                 }
              //               },
              //               decoration: CustomDropdownDecoration(
              //                   closedBorder: Border.all(color: Colors.black)),
              //               listItemBuilder: (context, item, isSelected, onItemSelect) =>
              //                   Text(item.name!),
              //               hintBuilder: (context, hint) {
              //                 return Text(hint);
              //               },
              //               headerBuilder: (context, selectedItem) {
              //                 return Text(selectedItem.name!);
              //               },
              //               items: cubit.country!.regions,
              //               onChanged: (Regions? value) {
              //                 cubit.updateRegion(value!);
              //                 log('${cubit.regions!.name}: ${value.name}');
              //               },
              //             );
              //           },
              //         ),
              //       ),
              //     if (cubit.regions != null)
              //       BlocBuilder<CountryCubit, CountryStates>(
              //         bloc: cubit,
              //         builder: (context, state) {
              //           return CustomDropdown<Cities>(
              //             hintText: 'Choose the Cities'.tr(),
              //             validator: (value) {
              //               if (cubit.cities == null) {
              //                 return 'Please choose the cities';
              //               } else {
              //                 return null;
              //               }
              //             },
              //             decoration: CustomDropdownDecoration(
              //                 closedBorder: Border.all(color: Colors.black)),
              //             listItemBuilder: (context, item, isSelected, onItemSelect) =>
              //                 Text(item.name!),
              //             hintBuilder: (context, hint) {
              //               return Text(hint);
              //             },
              //             headerBuilder: (context, selectedItem) {
              //               return Text(selectedItem.name!);
              //             },
              //             items: cubit.regions!.cities,
              //             onChanged: (Cities? value) {
              //               cubit.updateCity(value!);
              //               log('${cubit.cities!.name}: ${value.name}');
              //             },
              //           );
              //         },
              //       ),
              //     if (cubit.cities != null)
              //       Padding(
              //         padding: EdgeInsetsDirectional.only(top: 20.r),
              //         child: BlocBuilder<CountryCubit, CountryStates>(
              //           bloc: cubit,
              //           builder: (context, state) {
              //             return CustomDropdown<Districts>(
              //               hintText: 'Choose the districts'.tr(),
              //               validator: (value) {
              //                 if (cubit.districts == null) {
              //                   return 'Please choose the districts';
              //                 } else {
              //                   return null;
              //                 }
              //               },
              //               decoration: CustomDropdownDecoration(
              //                   closedBorder: Border.all(color: Colors.black)),
              //               listItemBuilder: (context, item, isSelected, onItemSelect) =>
              //                   Text(item.name!),
              //               hintBuilder: (context, hint) {
              //                 return Text(hint);
              //               },
              //               headerBuilder: (context, selectedItem) {
              //                 return Text(selectedItem.name!);
              //               },
              //               items: cubit.cities!.districts,
              //               onChanged: (Districts? value) {
              //                 cubit.updateDistrict(value!);
              //                 log('${cubit.districts!.name}: ${value.name}');
              //               },
              //             );
              //           },
              //         ),
              //       ),
              //   ],
              // ),



              Column(
                children: [
                  BlocBuilder<CountryCubit, CountryStates>(
                    bloc: cubit,
                    builder: (context, state) {
                      return cubit.countryModel != null
                          ? CustomDropdown<DataCountry>(
                        hintText: 'Choose the country'.tr(),
                        validator: (value) {
                          if (cubit.countryModel == null || value == null) {
                            return 'Please choose the country';
                          } else {
                            return null;
                          }
                        },
                        decoration: CustomDropdownDecoration(
                            closedBorder: Border.all(color: Colors.black)),
                        listItemBuilder: (context, item, isSelected, onItemSelect) =>
                            Text(item.name!),
                        hintBuilder: (context, hint) {
                          return Text(hint);
                        },
                        headerBuilder: (context, selectedItem) {
                          return Text(selectedItem.name!);
                        },
                        items: cubit.countryModel!.data!,
                        onChanged: (DataCountry? value) {
                          cubit.updateCountry(value!);
                          log('${cubit.country!.name}: $value');
                        },
                      )
                          : const Center(child: CircularProgressIndicator(color: Colors.teal));
                    },
                  ),
                  if (cubit.country != null)
                    Padding(
                      padding: EdgeInsetsDirectional.symmetric(vertical: 20.r),
                      child: BlocBuilder<CountryCubit, CountryStates>(
                        bloc: cubit,
                        builder: (context, state) {
                          if (cubit.country!.regions!.isNotEmpty) {
                            return CustomDropdown<Regions>(
                              hintText: 'Choose the region'.tr(),
                              validator: (value) {
                                if (cubit.regions == null) {
                                  return 'Please choose the region';
                                } else {
                                  return null;
                                }
                              },
                              decoration: CustomDropdownDecoration(
                                  closedBorder: Border.all(color: Colors.black)),
                              listItemBuilder: (context, item, isSelected, onItemSelect) =>
                                  Text(item.name!),
                              hintBuilder: (context, hint) {
                                return Text(hint);
                              },
                              headerBuilder: (context, selectedItem) {
                                return Text(selectedItem.name!);
                              },
                              items: cubit.country!.regions,
                              onChanged: (Regions? value) {
                                cubit.updateRegion(value!);
                                log('${cubit.regions!.name}: ${value.name}');
                              },
                            );
                          } else {
                            return const Center(child: CircularProgressIndicator(color: Colors.teal));
                          }
                        },
                      ),
                    ),
                  if (cubit.regions != null)
                    BlocBuilder<CountryCubit, CountryStates>(
                      bloc: cubit,
                      builder: (context, state) {
                        if (cubit.regions!.cities!.isNotEmpty) {
                          return CustomDropdown<Cities>(
                            hintText: 'Choose the Cities'.tr(),
                            validator: (value) {
                              if (cubit.cities == null) {
                                return 'Please choose the cities';
                              } else {
                                return null;
                              }
                            },
                            decoration: CustomDropdownDecoration(
                                closedBorder: Border.all(color: Colors.black)),
                            listItemBuilder: (context, item, isSelected, onItemSelect) =>
                                Text(item.name!),
                            hintBuilder: (context, hint) {
                              return Text(hint);
                            },
                            headerBuilder: (context, selectedItem) {
                              return Text(selectedItem.name!);
                            },
                            items: cubit.regions!.cities,
                            onChanged: (Cities? value) {
                              cubit.updateCity(value!);
                              log('${cubit.cities!.name}: ${value.name}');
                            },
                          );
                        } else {
                          return const Center(child: CircularProgressIndicator(color: Colors.teal));
                        }
                      },
                    ),
                  if (cubit.cities != null)
                    Padding(
                      padding: EdgeInsetsDirectional.only(top: 20.r),
                      child: BlocBuilder<CountryCubit, CountryStates>(
                        bloc: cubit,
                        builder: (context, state) {
                          if (cubit.cities!.districts!.isNotEmpty) {
                            return CustomDropdown<Districts>(
                              hintText: 'Choose the districts'.tr(),
                              validator: (value) {
                                if (cubit.districts == null) {
                                  return 'Please choose the districts';
                                } else {
                                  return null;
                                }
                              },
                              decoration: CustomDropdownDecoration(
                                  closedBorder: Border.all(color: Colors.black)),
                              listItemBuilder: (context, item, isSelected, onItemSelect) =>
                                  Text(item.name!),
                              hintBuilder: (context, hint) {
                                return Text(hint);
                              },
                              headerBuilder: (context, selectedItem) {
                                return Text(selectedItem.name!);
                              },
                              items: cubit.cities!.districts,
                              onChanged: (Districts? value) {
                                cubit.updateDistrict(value!);
                                log('${cubit.districts!.name}: ${value.name}');
                              },
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ),
                ],
              ),




                    Center(
                      child: MyButton(

                        width: double.infinity.w,
                        onPressed: (){


                          navigateTo(context, MapItem(cubit: cubit,));
                        },
                        margin: EdgeInsetsDirectional.symmetric(vertical: 20.r),
                        background: Colors.white70,
                        text: 'Show location on map'.tr(),
                        border: Border.all(color: Colors.teal),
                        textColor: Colors.teal,),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(

                          activeColor: cubit.isDefault! ? Colors.teal : Colors.transparent,
                          value: cubit.isDefault,
                          onChanged: (value) {
                            setState(() {
                              cubit.isDefault = value;
                            });
                          },
                          splashRadius: 20,
                          visualDensity: VisualDensity.compact,
                        ),

                        MyText(text: 'Default Address'.tr())
                      ],
                    ),
                    MyButton(
                      width: double.infinity.w,
                      onPressed: (){

                        cubit.addAddress();


                      },
                      margin: EdgeInsetsDirectional.symmetric(vertical: 20.r),
                      background: Colors.teal,
                      text: 'Add a new address'.tr(),
                      border: Border.all(color: Colors.teal),
                      textColor: Colors.white,),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
    }
}
