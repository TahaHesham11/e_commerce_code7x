
import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/bloc/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../custom/my_text.dart';
import '../../../../models/categoryModel.dart';
import '../../home/screen/Products/screen/filter_product/view.dart';

class CategoriesItem extends StatelessWidget {
  final DataCategory? dataCategory;

   CategoriesItem({super.key , this.dataCategory});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Wrap(

        children: List.generate(HomeCubit.get(context).categoryModel!.data!.data.length, (index) => GestureDetector(
          onTap: (){
            navigateTo(context,  const FilterProduct());
            HomeCubit.get(context).getOneCategory(categoryId:  HomeCubit.get(context).categoryModel!.data!.data[index].id!);
          },
          child: Container(
            margin: EdgeInsetsDirectional.only(top: 20.r),
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
                      borderRadius: BorderRadius.circular(15.r),
                        child: Image.network(
                          HomeCubit.get(context).categoryModel!.data!.data[index].image!,
                          height: 120.h,)),

                  ],
                ),
                Container(
                  padding: EdgeInsetsDirectional.all(10.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.grey[100],
                  ),
                  width: 130.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(

                        maxLine: 2,
                        text: HomeCubit.get(context).categoryModel!.data!.data[index].name!,

                        fontSize: 14.sp,
                      ),


                    ],
                  ),
                ),
              ],
            ),
          ),
        )
        ),
      ),
    );
  }
}
