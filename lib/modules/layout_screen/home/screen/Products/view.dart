import 'dart:math';
import 'package:e_commerce_code7x/cache_helper.dart';
import 'package:e_commerce_code7x/custom/custom_defaultField.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/compnents/product_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/cubit.dart';
import 'bloc/states.dart';


class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>SearchCubit()..getAllProduct(),
      child: BlocConsumer<SearchCubit,SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SearchCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title:  SizedBox(

                  height: 60.h,
                  width: 60.w,
                  child: Image.asset('assets/images/logo.png')),
              actions: [
                IconButton(
                  onPressed: () {
                  },
                  icon:  Image.asset('assets/images/notificationss.png',width: 35.w,height: 35.h,color: Colors.teal)

              ) ],


              leading:  IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon:  Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(6.r)
                      ),
                      child: CacheHelper.getData(key:'lang') == 'ar' ? Image.asset('assets/images/iconredo.png',height: 27.h,width: 27.w,):    Transform.rotate(
                          angle: pi,
                          child: Image.asset('assets/images/iconredo.png',height: 27.h,width: 27.w,))
                  )

              )

            ),


            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

              //   BlocBuilder(
              // bloc: cubit,
              //     builder: (context, state) {
              //       return cubit.categoryModel != null ? SizedBox(
              //         height: 130.h,
              //         child: ListView.separated(
              //           physics: const BouncingScrollPhysics(),
              //           scrollDirection: Axis.horizontal,
              //           itemBuilder: (context, index) {
              //
              //
              //             return CategoryItem(
              //               dataCategory:  cubit.categoryModel!.data!.data[index],
              //
              //               onPressed: () {
              //                 print( cubit.categoryModel!.data!.data[index].id);
              //                 navigateTo(context,  FilterProduct(
              //                   index: cubit.categoryModel!.data!.data[index].id,
              //
              //                 ));
              //             },
              //             );
              //           },
              //           separatorBuilder: (context, index) => SizedBox(width: 20.w),
              //           itemCount: cubit.categoryModel!.data!.data.length,
              //         ),
              //       ):CircularProgressIndicator(color: Colors.teal,);
              //     },
              //   ),

                  MyText(text: 'All Products'.tr(),margin: EdgeInsetsDirectional.symmetric(horizontal: 10.r),fontSize: 20.sp,fontWeight: FontWeight.bold,),
                CustomDefaultField(
                type: TextInputType.text,
                controller: cubit.searchController,
                label: 'Search'.tr(),
                prefix: Image.asset('assets/images/Search.png'),
                onChanged: (newText) {
                  cubit.getSearch(name: newText);

                },
              ),


                  if(state is GetSearchLoadingState)
                    const LinearProgressIndicator(color: Colors.teal,),

                  if(state is GetSearchSuccessState || state is GetAllProductSuccessState)
                    BlocBuilder(
                        bloc: cubit,
                        builder: (context, state) {

                          return cubit.productModel != null ?

                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8.0.h,
                              crossAxisSpacing: 8.0,
                              childAspectRatio: 1 / 1.5,
                            ),
                            itemCount:cubit.productModel!.data!.data!.length,
                            itemBuilder: (context, index) {
                              //productId = cubit.productModel!.data!.data![index].id!;

                              return ProductItem(
                                isSpace: false,
                                addToCart: true,
                                // dataCart: cubit.cartModel!.data!.items[index],

                                onPressed: (){},
                                onFavoritePressed: (){
                                  setState(() {
                                    HomeCubit.get(context).changeFavorite(
                                      // cubit.productModel!.data!.data![index].isFavourite!,
                                        id: cubit.productModel!.data!.data![index].id!
                                    );

                                    cubit.productModel!.data!.data![index].isFavourite = !cubit.productModel!.data!.data![index].isFavourite;

                                    // cubit.changeFavoriteModel!.data = !cubit.changeFavoriteModel!.data;

                                  });
                                  },

                                userData: cubit.productModel!.data!.data![index],

                                // categories: cubit.categoryModel!.data!.data[index],
                              );
                              },
                          )
                              : const CircularProgressIndicator(color: Colors.teal,) ;
                        }

                        ),


              // ListView.builder(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemBuilder: (context, index) =>  ProductItem(
              //     userData: cubit.productModel!.data!.data![index],
              //     onFavoritePressed: (){
              //       // setState(() {
              //       //   cubit.changeFavorite(
              //       //     // cubit.productModel!.data!.data![index].isFavourite!,
              //       //       id: cubit.productModel!.data!.data![index].id!
              //       //   );
              //       //
              //       //   cubit.productModel!.data!.data![index].isFavourite = !cubit.productModel!.data!.data![index].isFavourite;
              //       //
              //       //   // cubit.changeFavoriteModel!.data = !cubit.changeFavoriteModel!.data;
              //       //
              //       // });
              //     },
              //
              //   ),
              //   itemCount: cubit.productModel!.data!.data!.length,
              // ),

                ],
              ),
            ),

          );
        },
      ),
    );
  }
}
