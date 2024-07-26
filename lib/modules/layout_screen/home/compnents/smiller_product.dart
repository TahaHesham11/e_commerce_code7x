
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/cubit.dart';

class SmillerProduct extends StatefulWidget {
  final  DataProduct? userData;
  final void Function()? onFavoritePressed;

  final CategoriesByID?  categoriesById;

  const SmillerProduct({super.key,
    required this.onFavoritePressed,
    required this.categoriesById,
    this.userData ,
  });

  @override
  State<SmillerProduct> createState() => _SmillerProductState();
}

class _SmillerProductState extends State<SmillerProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: 155.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              if(widget.categoriesById!.image != null)
              ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.network(widget.categoriesById!.image!,height: 140.h,)),
              Positioned(
                  top: 8.r,
                  // right: 15.r,
                  child: CircleAvatar(
                    radius: 18.r,
                    backgroundColor: Colors.black,
                    child: IconButton(
                      onPressed: widget.onFavoritePressed,

                      icon: Icon(
                        widget.userData!.isFavourite ? Icons.favorite : Icons.favorite_border,
                        size: 18.sp,
                        color: Colors.white,
                      ),
                    ),
                  )
              ),





            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.grey[100],


            ),
            padding: EdgeInsetsDirectional.all(5.r),
            width: 145.w,
            margin: EdgeInsetsDirectional.only(end: 12.r),
            height: 100.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  maxLine: 2,
                  text: widget.categoriesById!.name!,
                  fontSize: 14.sp,
                  margin: EdgeInsetsDirectional.symmetric(vertical: 5.r),

                ),
                MyText(
                  maxLine: 2,
                  text: widget.categoriesById!.description!,
                  fontSize: 14.sp,
                  margin: EdgeInsetsDirectional.symmetric(vertical: 5.r),

                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
