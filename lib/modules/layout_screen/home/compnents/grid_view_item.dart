import 'package:e_commerce_code7x/cache_helper.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/models/cart_model.dart';
import 'package:e_commerce_code7x/models/categoryModel.dart';
import 'package:e_commerce_code7x/models/product_model.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/bloc/cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewItem extends StatelessWidget {
  final void Function()? onFavoritePressed;
  final void Function()? onPressed;

    final  DataProduct userData;
    final DataCategory? categories;
    final List<Items>? dataCart;


    const GridViewItem({super.key,
     this.onPressed,
     this.dataCart,
     required this.onFavoritePressed,
     required this.userData ,
      this.categories,

   });



  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onPressed,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Container(
          height: 300.h,
          width: 150.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 1.0,
                blurRadius: 1.0,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height:150.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.network(
                        '${userData.coverImage}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: CacheHelper.getData(key: 'lang') == 'ar' ? AlignmentDirectional.topEnd : AlignmentDirectional.topStart ,
                      child: CircleAvatar(
                        radius: 18.r,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: onFavoritePressed,
                          icon: Icon(
                            userData.isFavourite ? Icons.favorite : Icons.favorite_border,
                            size: 18.sp,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                MyText(
                  margin: EdgeInsetsDirectional.only(top: 8.r),
                  text: userData.name!,
                  fontSize: 14.sp,
                  maxLine: 1,
                ),
                MyText(
                  margin: EdgeInsetsDirectional.only(top: 5.r,bottom: 5.r),
                  text:userData.descriptionWithoutHtml!,
                  color: Colors.black,
                  fontSize: 11.sp,
                  height: 1.5,
                  maxLine: 3,
                ),

                Row(
                  children: [
                    if (userData.price != null)
                      MyText(text: '${userData.price}', fontSize: 12.sp, margin: EdgeInsetsDirectional.only(end: 3.r)),

                    if (userData.discountedPrice != 0 && userData.discountedPrice != null)
                      MyText(
                        text: '${userData.discountedPrice}',
                        color: Colors.red,
                        fontSize: 10.sp,
                        decoration: TextDecoration.underline,
                      ),

                    const Spacer(),

                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 20.0.r),
                      child: Container(
                        height: 30.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.teal,
                        ),
                        child: IconButton(
                          onPressed: () {
                            try {
                              HomeCubit.get(context).sendCart(productId: userData.id!, quantity: 1);
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
                          icon: Icon(
                            Icons.add,
                            size: 15.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
