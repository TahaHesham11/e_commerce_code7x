import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/custom/custom_app_bar.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/modules/layout_screen/Categories/view.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/bloc/states.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/compnents/product_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({super.key});

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {



        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: CustomAppBar(

            text: MyText(
              text:"Search results".tr(),
              fontSize: 20.sp,
              color: Colors.teal,
            ),
            isAction: true,
            imageBack:  IconButton(
                onPressed: () {
                  navigateAndFinish(context, const CategoryScreen());
                },
                icon:  Container(
                    height: 45.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(6.r)
                    ),
                    child:   Image.asset('assets/images/category.png',height: 35.h,width:35.w,color: Colors.black)
                )

            ),
          ),


          body: Padding(
            padding: EdgeInsets.all(15.r),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [


                  // if (cubit.filterSearchProductList != null)
                  //   Padding(
                  //     padding: EdgeInsetsDirectional.only(
                  //         start: 15.r, top: 10.r, bottom: 20.r),
                  //     child: GridView.builder(
                  //       shrinkWrap: true,
                  //       physics: const NeverScrollableScrollPhysics(),
                  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //         crossAxisCount: 2,
                  //         mainAxisSpacing: 8.0.h,
                  //         crossAxisSpacing: 8.0,
                  //         childAspectRatio: 1 / 1.6,
                  //       ),
                  //       itemCount: cubit.filterSearchProductList!.length,
                  //       itemBuilder: (context, index) {
                  //         return ProductItem(
                  //           userData: cubit.filterSearchProductList![index],
                  //           onFavoritePressed: () {
                  //             setState(() {
                  //               cubit.changeFavorite(
                  //                 id: cubit.productModel!.data!.data![index].id!,
                  //               );
                  //
                  //               cubit.productModel!.data!.data![index].isFavourite =
                  //               !cubit.productModel!.data!.data![index].isFavourite;
                  //             });
                  //           },
                  //         );
                  //       },
                  //     ),
                  //   ),



              BlocBuilder(
                bloc: cubit,
                builder: (context, state) {
                  if(state is FilterSearchProductLoadingState){
                    return        const Center(child: CircularProgressIndicator(color: Colors.teal,));

                  }else if(cubit.filterSearchProductList!.isEmpty){
                    return Center(child: MyText(text: 'This page empty'.tr()));

                  }else{
                    return Padding(
                      padding:  EdgeInsetsDirectional.only(start: 15.r,top: 10.r),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8.0.h,
                          crossAxisSpacing: 8.0,
                          childAspectRatio: 1 / 1.6,
                        ),
                        itemCount: cubit.filterSearchProductList!.length,
                        itemBuilder: (context, index) {

                          return ProductItem(
                            userData: cubit.filterSearchProductList![index],
                            onFavoritePressed: (){
                              setState(() {
                                cubit.changeFavorite(
                                  // cubit.productModel!.data!.data![index].isFavourite!,
                                    id: cubit.productModel!.data!.data![index].id!
                                );

                                cubit.productModel!.data!.data![index].isFavourite = !cubit.productModel!.data!.data![index].isFavourite;

                                // cubit.changeFavoriteModel!.data = !cubit.changeFavoriteModel!.data;

                              });
                            },
                          );
                        },
                      ),
                    );
                  }
                },
             )
            
            
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
