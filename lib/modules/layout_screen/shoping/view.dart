import 'dart:math';
import 'package:e_commerce_code7x/cache_helper.dart';
import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/custom/custom_rating.dart';
import 'package:e_commerce_code7x/custom/custom_text_button.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/bloc/states.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/compnents/product_item.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/review/screen/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/review/screen/view.dart';
import 'package:e_commerce_code7x/modules/layout_screen/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../models/product_model.dart';
import '../../../models/review_model.dart';

class ShoppingScreen extends StatefulWidget {
  final int? id;
  final DataProduct? userData;

  final int catId;
  final DataProduct? dataProduct;
  final CategoriesByID? categories;
 final ReviewModel? reviewModel;
  const ShoppingScreen(
      {super.key,
      this.id,
        this.reviewModel,
      this.categories,
      this.userData,
      this.dataProduct,
      required this.catId});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().getCategoryIdInProduct(catsId: widget.catId);
    super.initState();
  }

  bool isLove = false;
  bool showFullText = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0.0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: MyText(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              text: 'Product details'.tr(),
            ),
            leading: IconButton(
                onPressed: () {
                  navigateTo(context, const LayoutScreen());
                },
                icon: CacheHelper.getData(key: 'lang') == 'en'
                    ? Transform.rotate(
                        angle: pi,
                        child: Image.asset('assets/images/iconredo.png'))
                    : Image.asset('assets/images/iconredo.png')),
            actions: [
              Image.asset(
                'assets/images/iconshop.png',
                width: 35.w,
                height: 35.h,
              ),
            ],
          ),
          floatingActionButton: MaterialButton(
            onPressed: () async {
              try {
                HomeCubit.get(context)
                    .sendCart(productId: widget.dataProduct!.id!, quantity: 1);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.teal,
                    content: Text(
                      'Added Successfully'.tr(),
                      textAlign: TextAlign.center,
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                );
              } catch (e) {}
            },
            child: Container(
              width: 200.5.w,
              height: 57.h,
              padding: EdgeInsetsDirectional.all(10.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.r),
                color: Colors.red,
                gradient: const LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Color(0xffCD4078),
                    Color(0xff6169B1),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/bag.png',
                    width: 20,
                    height: 20,
                  ),
                  MyText(
                    text: 'addToCart'.tr(),
                    margin: EdgeInsetsDirectional.only(start: 10.r),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 300.h,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100.r),
                            bottomRight: Radius.circular(100.0.r),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(100.r),
                                  bottomRight: Radius.circular(100.0.r),
                                ),
                                color: Colors.black.withOpacity(0.2),
                              ),
                              child: Image.network(
                                widget.dataProduct!.coverImage!,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.r, vertical: 15.0.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              flex: 6,
                              child: MyText(
                                text: widget.dataProduct!.name!,
                              )),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  cubit.changeFavorite(
                                    id: widget.dataProduct!.id!,
                                  );
                                  widget.dataProduct!.isFavourite =
                                      !widget.dataProduct!.isFavourite;
                                });
                              },
                              icon: Icon(
                                  widget.dataProduct!.isFavourite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  size: 22.sp,
                                  color: const Color(0xffCD4078)),
                            ),
                          ),
                        ],
                      ),
                      if (widget.dataProduct!.basePrice != null)
                        MyText(
                            text: '${widget.dataProduct!.basePrice}',
                            color: const Color(0xffCD4078),
                            fontSize: 20.sp),
                      Row(
                        children: [
                          Rating(
                              initialRating: widget.dataProduct!.rating,
                              onRatingUpdate: (double rating) {
                                HomeCubit.get(context).postRating(
                                    id: widget.dataProduct!.id!,
                                    rating: rating);
                              }),
                          MyText(
                            text: '${widget.dataProduct!.rating}',
                            margin: EdgeInsetsDirectional.only(
                                start: 5.r, end: 10.r),
                          ),
                               CustomTextButton(
                               text:'Comments'.tr(),
                               fontSize: 12.sp,
                               onPressed: () {
                                 navigateTo(context,ReviewsScreen(id: widget.dataProduct!.id!,));
                                 },
        ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.all(20.r),
                  padding: EdgeInsetsDirectional.all(10.r),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, -3),
                          blurRadius: 8,
                          spreadRadius: 0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Column(
                    children: [
                      Row(
                        children: [MyText(text: 'ProductDescription'.tr())],
                      ),
                      Text(
                        showFullText
                            ? widget.dataProduct!.descriptionWithoutHtml!
                            : widget.dataProduct!.descriptionWithoutHtml!
                                .substring(0, 200),
                        maxLines: 30,
                        style: TextStyle(
                            height: 2.h,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300),
                      ),
                      CustomTextButton(
                        onPressed: () {
                          setState(() {
                            showFullText = !showFullText;
                          });
                        },
                        text: showFullText ? 'Hide'.tr() : 'Read more'.tr(),
                        fontSize: 12.sp,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.all(5.r),
                    margin: EdgeInsetsDirectional.all(10.r),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.r),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.network(
                              widget.dataProduct!.coverImage!,
                              // fit: BoxFit.cover,
                              // height: 40.0.h,
                              // width: 40.w,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(start: 10.0.r),
                            child: MyText(
                              text: widget.dataProduct!.categories!.first.name!,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.0.r, vertical: 10.r),
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        MyText(
                          text: 'Similar products'.tr(),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        const Spacer(),
                        MyText(
                          text: 'Show All'.tr(),
                          fontSize: 14.sp,
                        ),
                      ],
                    ),
                  ),
                ),
                BlocBuilder(
                  bloc: cubit,
                  builder: (context, state) {
                    return cubit.similarModel != null
                        ? SizedBox(
                            height: 250.h,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: cubit.similarList!.length,
                              itemBuilder: (context, index) {
                                //   catId=cubit.similarModel!.data!.data![index].categories!.first.id;
                                return ProductItem(
                                  onFavoritePressed: () {
                                    setState(() {
                                      cubit.changeFavorite(
                                          id: cubit.productModel!.data!
                                              .data![index].id!);

                                      cubit.similarList![index].isFavourite =
                                          !cubit
                                              .similarList![index].isFavourite;
                                    });
                                  },
                                  addToCart: false,
                                  userData: cubit.similarList![index],
                                );
                              },
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                            color: Colors.teal,
                          ));
                  },
                ),
                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
