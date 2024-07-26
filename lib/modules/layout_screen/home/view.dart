import 'package:card_swiper/card_swiper.dart';
import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/modules/layout_screen/Categories/view.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/bloc/states.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/compnents/category_item.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/notification/view.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/screen/Products/view.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/screen/best_seller/view.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/screen/discount_offers/view.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/screen/latest_product/view.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/search/view.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../custom/custom_text_button.dart';
import 'compnents/product_item.dart';
import 'screen/Products/screen/filter_product/view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getProduct();
    context.read<HomeCubit>().getCategory();
    context.read<HomeCubit>().getSlider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        centerTitle: true,
        title: SizedBox(
            height: 60.h,
            width: 60.w,
            child: Image.asset('assets/images/logo.png')),
        leading: Container(
          margin: EdgeInsetsDirectional.only(start: 10.r),
          child: Row(
            children: [
              Expanded(
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/images/iconshop.png',
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Expanded(child: GestureDetector(

                  onTap: (){
                    navigateTo(context, const NotificationScreen());
                  },
                  child: Image.asset('assets/images/notificationss.png'))),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(15.0.r),
          child: Column(
            children: [
              MaterialButton(
                onPressed: () {
                  navigateTo(context, const SearchScreen());
                },
                child: Container(
                  height: 50.h,
                  margin: EdgeInsetsDirectional.only(bottom: 20.r),
                  padding: EdgeInsetsDirectional.all(10.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Colors.black)),
                  child: Row(
                    children: [
                      Image.asset('assets/images/Search.png'),
                      MyText(
                          margin: EdgeInsetsDirectional.only(start: 5.r),
                          text: 'Search'.tr())
                    ],
                  ),
                ),
              ),
              BlocConsumer<HomeCubit, HomeStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  final cubit = HomeCubit.get(context);

                return cubit.sliderModel != null && cubit.categoryModel !=null && cubit.latestModel != null && cubit.bestSellerList != null
                    &&cubit.discountModel != null && cubit.productModel != null?
                   Column(
                    children: [
                      SizedBox(
                        height: 130.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: Swiper(
                            pagination: const SwiperPagination(),
                            autoplay: true,
                            itemCount: cubit.sliderModel!.banners.length,
                            itemBuilder: (context, index) {
                              return Image.network(cubit
                                  .sliderModel!.banners[index].image!);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 8.0.r, vertical: 10.r),
                        child: GestureDetector(
                          onTap: () {
                            navigateTo(context, const CategoryScreen());
                          },
                          child: Row(
                            children: [
                              MyText(
                                text: 'Category'.tr(),
                                color: Colors.teal,
                              ),
                              const Spacer(),
                              MyText(
                                text: 'Show All'.tr(),
                                color: Colors.grey,
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 130.h,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryItem(
                              dataCategory:
                              cubit.categoryModel!.data!.data[index],
                              onPressed: () {
                                navigateTo(
                                    context, const FilterProduct());
                                cubit.getOneCategory(
                                    categoryId: cubit.categoryModel!.data!
                                        .data[index].id!);
                                // print( cubit.categoryModel!.data!.data[index].id);
                              },
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 20.w),
                          itemCount:
                          cubit.categoryModel!.data!.data.length,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(top: 15.r),
                        child: GestureDetector(
                          onTap: () {
                            navigateTo(context, const LatestProductScreen());
                          },
                          child: Row(
                            children: [
                              Text(
                                'Latest products'.tr(),
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.teal,
                                ),

                              ),
                              const Spacer(),
                              MyText(
                                text: 'Show All'.tr(),
                                color: Colors.grey,
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 240.h,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ProductItem(
                              addToCart: false,
                              onPressed: () {
                                try {

                                  navigateAndFinish(context, ShoppingScreen(
                                    catId: cubit.latestModel!.data!.data![index].categories!.first.id,
                                    dataProduct: cubit.latestModel!.data!.data![index],
                                    id: cubit.latestModel!.data!.data![index].id,
                                  ));
                                } catch (e, p) {
                                  print(e.toString());
                                  print(p.toString());
                                }
                              },
                              onFavoritePressed: () {
                                setState(() {
                                  cubit.changeFavorite(
                                    // cubit.productModel!.data!.data![index].isFavourite!,
                                      id: cubit.latestModel!.data!.data![index].id!);

                                  cubit.latestModel!.data!.data![index].isFavourite =
                                  !cubit.latestModel!.data!.data![index].isFavourite;

                                  // cubit.changeFavoriteModel!.data = !cubit.changeFavoriteModel!.data;
                                });
                              },

                              userData: cubit.latestModel!.data!.data![index],
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(width: 10.w),

                          itemCount: cubit.latestModel!.data!.data!.length,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(top: 15.r),
                        child: GestureDetector(
                          onTap: () {
                            navigateTo(context, const BestSeller());
                          },
                          child: Row(
                            children: [
                              MyText(
                                text: 'Best seller'.tr(),
                                fontSize: 15.sp,
                                color: Colors.teal,
                              ),

                              const Spacer(),
                              MyText(
                                text: 'Show All'.tr(),
                                color: Colors.grey,
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 240.h,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            //    var category = cubit.categoryData![index];

                            return ProductItem(
                              addToCart: false,
                              onPressed: () {
                                navigateAndFinish(
                                    context,
                                    ShoppingScreen(
                                      catId: cubit.bestSellerProduct!.data!.data![index].categories!.first.id,
                                      dataProduct:
                                      cubit.bestSellerList![index],
                                      id: cubit.bestSellerProduct!.data!.data![index].id,
                                    ));
                              },
                              onFavoritePressed: () {
                                setState(() {
                                  cubit.changeFavorite(

                                      id: cubit.bestSellerProduct!.data!.data![index].id!);

                                cubit.bestSellerProduct!.data!.data![index].isFavourite = !cubit.bestSellerProduct!.data!.data![index].isFavourite;

                                });
                              },
                              userData: cubit.bestSellerList![index],
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 10.w),
                          itemCount: cubit.bestSellerList!.length,
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 15.0.r),
                        child: ClipRRect(

                            borderRadius: BorderRadius.circular(5.r),

                            child: Image.asset('assets/images/Banner.png')),
                      ),


                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.r),
                        child: GestureDetector(
                          onTap: () {
                            navigateTo(context, const DiscountOffersScreen());
                          },
                          child: Row(
                            children: [
                              MyText(
                                text: 'Discount offers'.tr(),
                                fontSize: 15.sp,
                                color: Colors.teal,
                              ),

                              const Spacer(),
                              MyText(
                                text: 'Show All'.tr(),
                                color: Colors.grey,
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 240.h,
                        child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return ProductItem(
                                onPressed: () {
                                  navigateAndFinish(
                                      context,
                                      ShoppingScreen(
                                        catId: cubit.discountProductsLis![index].categories!.first.id,

                                        dataProduct: cubit.discountProductsLis![index],
                                        id: cubit.discountProductsLis![index].id,
                                      ));

                                  // HomeCubit.get(context).getCategoryIdInProduct(catsId: cubit.productModel!.data!.data![index].categories![index].id);
                                  // print( cubit.productModel!.data!.data![index].categories![index].id);
                                },
                                addToCart: false,
                                onFavoritePressed: () {
                                  setState(() {
                                    cubit.changeFavorite(
                                        id: cubit.discountProductsLis![index].id!);

                                    cubit.discountProductsLis![index].isFavourite =
                                    !cubit.discountProductsLis![index].isFavourite;

                                    // cubit.changeFavoriteModel!.data = !cubit.changeFavoriteModel!.data;
                                  });
                                },
                                userData: cubit.discountModel!.data!.data![index],
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(width: 10.w,),

                            itemCount: cubit.discountModel!.data!.data!.length),
                      ),




                      Padding(
                        padding: EdgeInsetsDirectional.only(top: 5.r),
                        child: GestureDetector(
                          onTap: () {
                            navigateTo(context, const ProductScreen());
                          },
                          child: Row(
                            children: [
                              CustomTextButton(
                                onPressed: () {},
                                text: 'Products'.tr(),
                                fontSize: 15.sp,
                              ),
                              const Spacer(),
                              MyText(
                                text: 'Show All'.tr(),
                                color: Colors.grey,
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      ),

                      BlocBuilder(
                          bloc: cubit,
                          builder: (context, state) {
                            return SizedBox(
                              height: 240.h,
                              child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {

                                  return ProductItem(
                                    onPressed: () {
                                      navigateAndFinish(
                                          context,
                                          ShoppingScreen(
                                            catId: cubit.productModel!.data!.data![index].categories!.first.id,

                                            dataProduct: cubit.productModel!.data!.data![index],
                                            id: cubit.productModel!.data!.data![index].id,
                                          ));
                                    },
                                    addToCart: false,
                                    onFavoritePressed: () {
                                      setState(() {
                                        cubit.changeFavorite(
                                          // cubit.productModel!.data!.data![index].isFavourite!,
                                            id: cubit.productModel!.data!
                                                .data![index].id!);

          cubit.productModel!.data!.data![index].isFavourite = !cubit.productModel!.data!.data![index].isFavourite;

                                      });
                                    },
                                    userData: cubit.productModel!.data!.data![index],
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    SizedBox(width: 10.w),
                                itemCount: cubit.productModel!.data!.data!.length,
                              ),
                            );

                          }),
                    ],
                  ):const Center(child: CircularProgressIndicator(color: Colors.teal,));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
