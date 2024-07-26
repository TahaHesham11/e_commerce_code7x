import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/models/categoryModel.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/screen/Products/screen/filter_product/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {

  final DataCategory dataCategory;
  final void Function()? onPressed;

  const CategoryItem({
    super.key,
    required this.dataCategory,
    required this.onPressed,
  });


  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: onPressed,
      // onTap: (){
      //    // HomeCubit.get(context).fetchFilterCats(id: dataCategory.id!);
      //   navigateTo(context,  FilterProduct());
      //
      //
      // },
      child: SizedBox(
        width: 80.w,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black38,
                    spreadRadius: 1.0,
                    blurRadius: 1.0,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Image.network(
               dataCategory.image! ,
              ),
            ),
            MyText(
              text: dataCategory.name!,
              fontSize: 14.sp,
              maxLine: 2,
              textAlign: TextAlign.center,

              margin: EdgeInsets.only(top: 10.r),
            ),
          ],
        ),
      ),
    );
  }
}
