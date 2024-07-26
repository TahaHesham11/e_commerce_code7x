import 'package:e_commerce_code7x/custom/custom_rating.dart';
import 'package:e_commerce_code7x/custom/my_button.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/models/product_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../models/get_favorite_model.dart';


class FavoriteItem extends StatefulWidget {
  final ProductData? detum;
  final void Function()? onPressed;

  const FavoriteItem({
    super.key,
    this.detum,
    required this.onPressed
  });

  @override
  State<FavoriteItem> createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.symmetric(horizontal: 10.r),
      padding: EdgeInsetsDirectional.all(10.r),
      width: double.infinity,
      height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, -3),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white38.withOpacity(0.1),
                  offset: const Offset(0, 5),
                  blurRadius: 9,
                  spreadRadius: 0,
                  blurStyle: BlurStyle.normal,
                ),
              ],
            ),
            padding: EdgeInsetsDirectional.all(10.r),

            child:
           ClipRRect(
             borderRadius: BorderRadius.circular(15.r),
             child: Image.network(
               widget.detum!.coverImage!,
               fit: BoxFit.cover,
               width: 100.w,
               height: 140.0.h,
             ),
           ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 5.0.r, end: 10.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: widget.detum!.name!,
                    fontWeight: FontWeight.bold,
                    maxLine: 2,
                    fontSize: 16.sp,
                  ),


                  Padding(
                    padding:  EdgeInsetsDirectional.only(top: 5.r,bottom: 5.r),
                    child: Row(
                      children: [
                        RatingBar.builder(

                            itemSize: 15.sp,
                            initialRating: 1.0,
                            minRating: 0.5,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 1,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              size: 1.sp,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (value){}

                        ),
                        MyText(
                          margin: EdgeInsetsDirectional.only(start: 5.r),
                          overflow: TextOverflow.ellipsis,
                          maxLine: 1,
                          text: '${widget.detum!.rating}',
                          color: Colors.grey,
                          fontSize: 12.sp,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      MyText(
                        text: widget.detum!.basePrice!,
                        fontSize: 12.sp,
                        color: Colors.teal,
                      ),

                      if(widget.detum!.discountedPrice != null && widget.detum!.basePrice != null)

                      Container(
                        margin: EdgeInsetsDirectional.only(start: 10.r),

                        child: MyText(
                          padding: EdgeInsetsDirectional.all(5.r),
                          text: '${(((double.parse(widget.detum!.basePrice!) - double.parse(widget.detum!.discountedPrice!)) / double.parse(widget.detum!.basePrice!)) * 100).toStringAsFixed(0)}%',
                          color: Colors.red,fontSize: 12.sp,fontWeight: FontWeight.bold,),
                      ),
                      if(widget.detum!.discountedPrice != null && widget.detum!.basePrice != null)

                        MyText(text: 'Discount'.tr(),fontSize: 12.sp,color: Colors.red,)
                    ],
                  ),
                  Spacer(),
                  MyButton(
                    margin: EdgeInsetsDirectional.only(top: 10.r,bottom: 5.r),
                    gradient: const LinearGradient(
                  begin: Alignment.centerRight, end: Alignment.centerLeft,
                      colors: [
                    Color(0xffCD4078),
                      Color(0xff6169B1),

                    ],
                    ),
                    height: 27.h,
                    width: 88.w,
                      onPressed: (){},
                    textAlign: TextAlign.center,
                      text: 'Buy now'.tr(),)
                ],
              ),
            ),
          ),
          // Column(
          //   children: [
          //     IconButton(
          //       onPressed: widget.onPressed,
          //       icon: Icon(
          //         widget.userData!.isFavourite ? Icons.favorite : Icons.favorite_border, color: Colors.teal,
          //       ),
          //     ),
          //     const Spacer(),
          //     Container(
          //       height: 35.h,
          //       width: 35.w,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(8.r),
          //         color: Colors.teal,
          //       ),
          //       child: IconButton(
          //         onPressed: () {},
          //         icon: Icon(
          //           Icons.add,
          //           size: 15.sp,
          //           color: Colors.white,
          //         ),
          //       ),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
