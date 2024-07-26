import 'package:e_commerce_code7x/cache_helper.dart';
import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/bloc/states.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/compnents/product_item.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/notification/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

import '../../bloc/cubit.dart';

class BestSeller extends StatefulWidget {
  const BestSeller({super.key});

  @override
  State<BestSeller> createState() => _BestSellerState();
}

class _BestSellerState extends State<BestSeller> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {},
      builder: (BuildContext context, state) {
        final cubit = HomeCubit.get(context);
        return  Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title:  SizedBox(

                  height: 60.h,
                  width: 60.w,
                  child: Image.asset('assets/images/logo.png')),
              actions: [IconButton(
                  onPressed: () {
                    navigateTo(context, const NotificationScreen());
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
            child: Padding(
              padding: EdgeInsets.all(15.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  MyText(text: 'Best seller'.tr(),margin: EdgeInsetsDirectional.symmetric(horizontal: 10.r,vertical: 20.r),fontSize: 20.sp,fontWeight: FontWeight.bold,),



                  BlocBuilder(
                      bloc: cubit,
                      builder: (context, state) {

                        return cubit.bestSellerList != null ?

                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8.0.h,
                            crossAxisSpacing: 8.0,
                            childAspectRatio: 1 / 1.6,
                          ),
                          itemCount:cubit.bestSellerList!.length,
                          itemBuilder: (context, index) {
                            //productId = cubit.productModel!.data!.data![index].id!;

                            return ProductItem(
                              addToCart: true,
                              isSpace: false,

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

                              userData: cubit.bestSellerList![index],

                              // categories: cubit.categoryModel!.data!.data[index],
                            );
                          },
                        )
                            : const Center(child: CircularProgressIndicator(color: Colors.teal,)) ;
                      }

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
