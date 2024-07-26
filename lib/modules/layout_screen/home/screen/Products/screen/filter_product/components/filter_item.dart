import 'package:e_commerce_code7x/custom/custom_rating.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/models/get_one_category.dart';
import 'package:e_commerce_code7x/models/product_model.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/bloc/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterItem extends StatelessWidget {

  final void Function()? onFavoritePressed;
  final void Function()? onPressed;
  final DataCategories subCategories;
  final  DataProduct userData;
    const FilterItem({super.key,
     required  this.subCategories,
      this.onPressed,
       this.onFavoritePressed,
      required this.userData,
    });

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsetsDirectional.all(10.r),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.network(
                     subCategories.image!,)),
                Positioned(
                    top: 8.r,
                    right: 15.r,
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CircleAvatar(
                        radius: 16.r,
                        backgroundColor: Colors.black,
                        child: IconButton(
                          onPressed: onFavoritePressed,

                          icon: Icon(
                            userData.isFavourite ? Icons.favorite : Icons.favorite_border,
                            size: 18.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                ),
                Positioned(
                  top: 8.r,
                  left: 5.r,
                  child: Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.red
                      ),
                      child: MyText(
                        padding: EdgeInsetsDirectional.all(5.r),
                        text: '35%',
                        color: Colors.white,fontSize: 12.sp,),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.grey[100],

              ),
              padding: EdgeInsetsDirectional.all(5.r),
              width: 155.w,
              height: 100.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    maxLine: 2,
                    text: subCategories.name!,
                    fontSize: 14.sp,
                    margin: EdgeInsetsDirectional.symmetric(vertical: 5.r),

                  ),
                  Row(
                    children: [
                      if (userData.price != null)

                        MyText(
                          text: '${userData.price}',
                          margin: EdgeInsetsDirectional.symmetric(vertical: 5.r),
                          fontSize: 12.sp,
                          color: Colors.red,
                        ),
                      if (userData.discountedPrice != 0 && userData.discountedPrice != null)

                        MyText(
                          margin: EdgeInsetsDirectional.only(start: 10.r),
                          text: '${userData.discountedPrice}',
                          fontSize: 12.sp,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                    ],
                  ),

                  Rating(
                    initialRating:  userData.rating,

                    onRatingUpdate: (double rating) {
                    HomeCubit.get(context).postRating(
                        id: userData.id!,
                        rating: rating);

                  },)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
