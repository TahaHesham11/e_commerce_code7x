import 'package:e_commerce_code7x/cache_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../custom/custom_rating.dart';
import '../../../../custom/my_text.dart';
import '../../../../custom/orders_model.dart';
import '../../../../models/categoryModel.dart';
import '../../../../models/product_model.dart';
import '../bloc/cubit.dart';


class ProductItem extends StatefulWidget {
  final void Function()? onFavoritePressed;
  final void Function()? onPressed;

  final  DataProduct? userData;
  final DataCategory? categories;
  final List<Items>? dataCart;
 final bool addToCart;
 final bool isSpace;

   const ProductItem({super.key,
    this.addToCart=false,
    this.onPressed,
    this.dataCart,
     this.isSpace = true,
    required this.onFavoritePressed,
     this.userData ,
    this.categories, });



  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {

  @override
  Widget build(BuildContext context) {
    return        GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: 200.h,
        width: 155.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(

          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.network(widget.userData!.coverImage!,height: 140.h,)),
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


                if(widget.userData!.discountedPrice != null && widget.userData!.price != null)
                Positioned(
                  right: CacheHelper.getData(key: 'lang') == 'en' ? 30.0.r : null,
                  left: CacheHelper.getData(key: 'lang') == 'ar' ? 15.0.r : null ,

                  top: 10.0.r,

                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.red
                    ),
                    child: MyText(
                      padding: EdgeInsetsDirectional.all(5.r),
                      text: '${(((double.parse(widget.userData!.price!) - double.parse(widget.userData!.discountedPrice!)) / double.parse(widget.userData!.price!)) * 100).toStringAsFixed(0)}%',
                      color: Colors.white,fontSize: 12.sp,),
                  ),
                ),



              widget.addToCart ?  Positioned(
                  top: 115.r,
                  child: ClipRRect(
                    child: GestureDetector(
                      onTap: (){
                        try {
                          HomeCubit.get(context).sendCart(productId: widget.userData!.id!, quantity: 1);
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
                        padding: EdgeInsetsDirectional.all(5.r),
                          width: 150.w,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Color(0xffCD4078),
                                Color(0xff6169B1),

                              ],
                            ),
                          ),

                          child: MyText(
                            textAlign: TextAlign.center,
                            text: 'addToCart'.tr(),fontSize: 15.sp,color: Colors.white,)),
                    ),
                  ),
                ) : Container()
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.grey[100],

              ),
              padding: EdgeInsetsDirectional.all(5.r),
              margin:widget.isSpace ?  EdgeInsetsDirectional.only(end: 9.r) : EdgeInsetsDirectional.only(end: 0.r) ,
              width: 145.w,
              height: 100.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    maxLine: 2,
                    text: widget.userData!.name!,
                    fontSize: 14.sp,
                    margin: EdgeInsetsDirectional.symmetric(vertical: 5.r),

                  ),
                  Row(
                    children: [
                      if (widget.userData!.price != null)

                        MyText(
                        text: '${widget.userData!.price}',
                        margin: EdgeInsetsDirectional.symmetric(vertical: 5.r),
                        fontSize: 12.sp,
                        color: Colors.red,
                      ),
                      if (widget.userData!.discountedPrice != 0 && widget.userData!.discountedPrice != null)

                      MyText(
                        margin: EdgeInsetsDirectional.only(start: 10.r),
                        text: '${widget.userData!.discountedPrice}',
                        fontSize: 12.sp,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ],
                  ),

                  Rating(
                      initialRating:  widget.userData!.rating,

                      onRatingUpdate: (double rating){
                    HomeCubit.get(context).postRating(
                        id: widget.userData!.id!,

                        rating: rating);
                  }
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
