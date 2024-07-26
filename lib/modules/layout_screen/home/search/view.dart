import 'dart:developer';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:another_xlider/another_xlider.dart';
import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/custom/custom_app_bar.dart';
import 'package:e_commerce_code7x/custom/custom_defaultField.dart';
import 'package:e_commerce_code7x/custom/my_button.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/models/categoryModel.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/bloc/states.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/search/screen/search_results/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  final DataCategory? dataCategory;

  const SearchScreen({super.key, this.dataCategory});

  @override
  State<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  // double minPrice = 0;
  // double maxPrice = 100;

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    controller.addListener(() async {
      await stoppingAnimation();
    });
  }

  Future stoppingAnimation() async {
    await Future.delayed(const Duration(seconds: 10));
    if (mounted) {
      controller.reset();
      controller.stop();
    }
    return true;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);

        return Scaffold(
          appBar: CustomAppBar(
            text: MyText(
              text: 'search'.tr(),
              fontSize: 20.sp,
              color: Colors.teal,
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: cubit.formKey,
              child: Column(
                children: [
                  //     Image.asset('assets/images/search.jpg',height:150.h,width:150.w),

                  CustomDefaultField(
                    type: TextInputType.text,
                    controller: cubit.searchController,
                    label: 'Search'.tr(),
                    prefix: Image.asset('assets/images/Search.png'),
                    onChanged: (name) {
                      setState(() {
                        cubit.searchName = name;
                      });
                    },
                  ),

                  //
                  // GestureDetector(
                  //   onTap: () {
                  //     setState(() {
                  //       isOpen = !isOpen;
                  //     });
                  //   },
                  //   child: Container(
                  //     padding: EdgeInsets.all(15.r),
                  //     margin: EdgeInsetsDirectional.all(10.r),
                  //     decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.grey),
                  //       borderRadius: BorderRadius.circular(10.r),
                  //     ),
                  //     child: Row(
                  //       children: [
                  //
                  //         Expanded(
                  //           flex: 4,
                  //           child: Padding(
                  //             padding:  EdgeInsetsDirectional.only(start: 10.0.r),
                  //             child: Text(
                  //               'تصنيفات رئيسيه',
                  //               style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),
                  //             ),
                  //           ),
                  //         ),
                  //         const Spacer(),
                  //         Icon(isOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // if (isOpen)
                  //
                  //   Container(
                  //     width: double.infinity,
                  //     margin: EdgeInsetsDirectional.all(10.r),
                  //     decoration: BoxDecoration(
                  //
                  //         borderRadius: BorderRadius.circular(5.r),
                  //         color: Colors.white,
                  //
                  //         boxShadow: [
                  //           BoxShadow(
                  //             color: Colors.black.withOpacity(0.2),
                  //             offset: const Offset(0, 3),
                  //             blurRadius: 8,
                  //             spreadRadius: 0,
                  //           ),
                  //         ]
                  //     ),
                  //     child: Wrap(
                  //         spacing: 10,
                  //         runSpacing: 10,
                  //         children:  List.generate(
                  //
                  //             cubit.categoryModel!.data!.data.length, (index){
                  //
                  //
                  //           dataCategory =  cubit.categoryModel!.data!.data[index];
                  //
                  //           return   Padding(
                  //             padding:  EdgeInsetsDirectional.all(10.r),
                  //             child: Text(
                  //                 dataCategory!.name!),
                  //           );
                  //         }
                  //
                  //         )
                  //     ),
                  //   ),

                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        top: 15.0.r, bottom: 15.r, start: 10.r, end: 10.r),
                    child: BlocBuilder<HomeCubit, HomeStates>(
                      bloc: cubit,
                      builder: (context, state) {
                        return cubit.categoryModel != null
                            ? CustomDropdown<DataCategory>(
                                hintText: 'Choose the Categories'.tr(),
                                // validator: (value) {
                                //   if (cubit.categoryModel == null || value == null) {
                                //     return 'Please choose the country';
                                //   } else {
                                //     return null;
                                //   }
                                // },

                                decoration: CustomDropdownDecoration(
                                    closedBorder:
                                        Border.all(color: Colors.black)),
                                listItemBuilder:
                                    (context, item, isSelected, onItemSelect) =>
                                        Text(item.name!),
                                hintBuilder: (context, hint) {
                                  return Text(hint);
                                },
                                headerBuilder: (context, selectedItem) {
                                  return Text(selectedItem.name!);
                                },
                                items: cubit.categoryModel!.data!.data,
                                onChanged: (DataCategory? value) {
                                  cubit.dataCategory = value;

                                  log('${cubit.dataCategory!.name}: $value');
                                },
                              )
                            : const Center(
                                child: CircularProgressIndicator(
                                color: Colors.teal,
                              ));
                      },
                    ),
                  ),

// GestureDetector(
//   onTap: () {
//     setState(() {
//       isDown = !isDown;
//     });
//   },
//   child: Container(
//     padding: EdgeInsets.all(15.r),
//     margin: EdgeInsetsDirectional.all(10.r),
//     decoration: BoxDecoration(
//       border: Border.all(color: Colors.grey),
//       borderRadius: BorderRadius.circular(10.r),
//     ),
//     child: Row(
//       children: [

//         Expanded(
//           flex: 4,
//           child: Padding(
//             padding:  EdgeInsetsDirectional.only(start: 10.0.r),
//             child: Text(
//               'تصنيفات فرعيه',
//               style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//         const Spacer(),
//         Icon(isDown ? Icons.arrow_drop_up : Icons.arrow_drop_down),
//       ],
//     ),
//   ),
// ),
// if (isDown)

//   Container(
//     width: double.infinity,
//     margin: EdgeInsetsDirectional.all(10.r),
//     decoration: BoxDecoration(

//         borderRadius: BorderRadius.circular(5.r),
//         color: Colors.white,

//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2),
//             offset: const Offset(0, 3),
//             blurRadius: 8,
//             spreadRadius: 0,
//           ),
//         ]
//     ),
//     child: Wrap(
//         spacing: 10,
//         runSpacing: 10,
//         children:  List.generate(

//             cubit.categoryModel!.data!.data.first.subCategories.length, (index){

//       subCategories = cubit.categoryModel!.data!.data.first.subCategories[index];

//           return   Row(
//             children: [
//               Expanded(
//                 flex: 1,
//                 child: ClipRRect(

//                   borderRadius: BorderRadius.circular(10.r),

//                   child: Image.network(
//                    ' subCategories!.image!',

//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex:4,
//                 child: Padding(
//                   padding:  EdgeInsetsDirectional.only(start: 8.0.r,end: 5.r),
//                   child: const Text(
//                       'subCategories!.name!'),
//                 ),
//               ),
//             ],
//           );
//         }

//         )
//     ),
//   ),




                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: 10.0.r,
                      bottom: 10.r,
                      start: 10.r,
                      end: 10.r,
                    ),
                    child: BlocBuilder<HomeCubit, HomeStates>(
                      bloc: cubit,
                      builder: (context, state) {
                        if (cubit.categoryModel?.data != null) {
   final subCategories = cubit.dataCategory != null ? cubit.dataCategory!.subCategories : cubit.categoryModel!.data!.data.last.subCategories;

                          if (subCategories.isNotEmpty) {
                            return CustomDropdown(
                              hintText: 'Choose the Categories'.tr(),
                              decoration: CustomDropdownDecoration(
                                closedBorder: Border.all(color: Colors.black),
                              ),
                              listItemBuilder: (context, item, isSelected, onItemSelect) =>
                                  Text(item.name!),
                              hintBuilder: (context, hint) => Text(hint),
                              headerBuilder: (context, selectedItem) =>
                                  Text(selectedItem.name!),
                              items: subCategories,
                              onChanged: (SubCategory? value) {
                                cubit.subCategory = value;
                                log('${cubit.subCategory!.name}: $value');
                              },
                            );
                          } else {
                            return Center(
                              child: Text('No categories available'.tr()),
                            );
                          }
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(color: Colors.teal),
                          );
                        }
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.r,
                    ),
                    child: Container(
                      margin: EdgeInsetsDirectional.only(top: 20.r),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 4,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: Padding(
                        padding: EdgeInsets.all(10.0.r),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Expanded(
                                  flex: 2,
                                  child: MyText(text: 'the price'),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: FlutterSlider(
                                    values: [cubit.lowerValue, cubit.upperValue],
                                    max: 10000,
                                    min: 0,
                                    onDragCompleted:
                                        (handlerIndex, lowerValue, upperValue) {
                                      setState(() {
                                        cubit.lowerValue = lowerValue;
                                        cubit.upperValue = upperValue;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            MyText(text: '${cubit.lowerValue}'),
                          ],
                        ),
                      ),
                    ),
                  ),

                  MyButton(
                    text: 'Search'.tr(),
                    width: double.infinity,
                    margin: EdgeInsetsDirectional.only(top: 25.r, bottom: 50.r, start: 20.r, end: 20.r),
                    onPressed: () {
                      if (cubit.searchName.isEmpty && cubit.lowerValue == 0 && cubit.upperValue == 2000) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: MyText(text: 'Please enter a search term or specify a price.'),
                          ),
                        );
                      } else {
                        double minPrice = cubit.lowerValue == 0 ? 0 : cubit.lowerValue;
                        double maxPrice = cubit.upperValue == 2000 ? 2000 : cubit.upperValue;
                        cubit.getFilterSearchProduct(
                          name: cubit.searchName,
                          priceMin: minPrice,
                          priceMax: maxPrice,
                        );
                        navigateTo(context, SearchResults());
                        // Do not navigate here, let the state change handle the navigation
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
