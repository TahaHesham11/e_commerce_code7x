import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/modules/layout_screen/Categories/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/Categories/bloc/states.dart';
import 'package:e_commerce_code7x/modules/layout_screen/Categories/components/category_item.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/search/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/validate.dart';

class CategoryScreen extends StatefulWidget {

  const CategoryScreen({super.key});

  @override
  CategoryScreenState createState() => CategoryScreenState();
}

class CategoryScreenState extends State<CategoryScreen> {


  List<bool> isOpenList = List.generate(6, (index) => false);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesCubit, CategoriesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CategoriesCubit.get(context);
        return Scaffold(

          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title:  SizedBox(

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
                  SizedBox(width: 5.w,),
                  Expanded(child: Image.asset('assets/images/notificationss.png')),

                ],
              ),
            ),
          ),


          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text:'Category'.tr(),
                  fontSize: 20.sp,
                  color: Colors.teal,
                  margin: EdgeInsetsDirectional.only(start: 15.r,top: 20.r,bottom: 20.r),
                ),
                MaterialButton(
                  onPressed: (){
                    navigateTo(context, const SearchScreen());
                  },
                  child: Container(
                    height: 50.h,
                    margin: EdgeInsetsDirectional.symmetric(vertical: 5.r),
                    padding: EdgeInsetsDirectional.all(10.r),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color:Colors.black)
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/images/Search.png'),
                         MyText(
                            margin: EdgeInsetsDirectional.only(start: 5.r),

                            text: 'Search'.tr()
                        )
                      ],
                    ),
                  ),),

               BlocBuilder(
                 bloc: cubit,
                 builder: (context, state) {
                   return cubit.categoryModel != null ?
                    CategoriesItem():const Center(child: CircularProgressIndicator(color: Colors.teal,));
                 },
               ),

                SizedBox(height: 60.h,)



              ],
            ),
          ),


        );
      },
    );
  }
}

