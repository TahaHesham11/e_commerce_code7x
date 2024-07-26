import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/models/cart_model.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/bloc/cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShoppingItem extends StatefulWidget {
  final Items userProduct;
  final void Function()? onPressed;
 final bool? isCheckCounter ;


  const ShoppingItem({
    required this.onPressed,
    super.key,
    required this.userProduct,
    this.isCheckCounter = true,
  });

  @override
  State<ShoppingItem> createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem> {
  int Counter = 1;
  bool isCounter = true;
  int? originalPrice; // متغير لتخزين قيمة السعر الأصلية

  @override
  void initState() {
    super.initState();
// تخزين قيمة السعر الأصلية عن بدء الاستعراض
    originalPrice = widget.userProduct.totalPrice!;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
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
                      blurStyle: BlurStyle.normal),
                ],
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.all(10.r),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image.network(
                    '${widget.userProduct.coverImage}',
                    fit: BoxFit.cover,
                    width: 100.w,
                    height: 140.0.h,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 5.0.r, end: 10.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyText(
                      text: widget.userProduct.name!,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      maxLine: 1,
                      margin: EdgeInsetsDirectional.only(bottom: 25.r),
                    ),
                    MyText(
                      text: '${widget.userProduct.totalPrice!}',
                      fontSize: 12.sp,
                      color: Colors.teal,
                    ),
                    widget.isCheckCounter! ?    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Container(
                            decoration:  BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey, width: 1.0.w),
                            ),
                            child: CircleAvatar(
                              radius: 16.r,
                              backgroundColor: Colors.transparent,
                              child: IconButton(
                                  onPressed: () {
                                    plusPrice();

                                    setState(() {
                                      Counter++;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    size: 16.sp,
                                    color: Colors.grey,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.0.r,
                            ),
                            child: Text('$Counter'),
                          ),
                          Container(
                            decoration:  BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey, width: 1.0.w),
                            ),

                            child: CircleAvatar(
                              radius: 16.r,
                              backgroundColor: Colors.transparent,
                              child: IconButton(
                                onPressed: () {
                                  minusPrice();
                                  setState(() {
                                    if (Counter > 1) {
                                      Counter--;
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.remove,
                                  size: 16.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ) : SizedBox(),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 35.h,
                    width: 35.w,
                    child: IconButton(
                        onPressed: () {
                          try {
                            ShoppingCubit.get(context)
                                .deleteCartItem(id: widget.userProduct.id);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.teal,
                                content: Text(
                                  'Deleted Successfully'.tr(),
                                  textAlign: TextAlign.center,
                                ),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          } catch (e) {}
                        },
                        icon: Image.asset('assets/images/trash.png')),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void plusPrice() {
    setState(() {
      widget.userProduct.totalPrice = originalPrice! * (Counter + 1);
    });
  }

  void minusPrice() {
    if (Counter > 1) {
      setState(() {
        widget.userProduct.totalPrice = originalPrice! * (Counter - 1);
      });
    }
  }
}
