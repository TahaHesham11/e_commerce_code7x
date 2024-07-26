import 'package:e_commerce_code7x/custom/custom_app_bar.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/bloc/states.dart';
import 'package:e_commerce_code7x/modules/layout_screen/settings/components/item_favorite.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteScreen extends StatefulWidget {
   const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getFavorite();

  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {

        var cubit = HomeCubit.get(context);


       return Scaffold(
         appBar: const CustomAppBar(isImage: false,),

         body: SingleChildScrollView(
           physics: const BouncingScrollPhysics(),
           child: Padding(
             padding:  EdgeInsets.all(10.0.r),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [


                 MyText(text: 'Favourite'.tr(),fontSize: 20.sp,margin: EdgeInsetsDirectional.only(start: 12.r,top: 10.r,bottom: 15.r),),



           BlocBuilder<HomeCubit,HomeStates>(
             bloc: cubit,
             builder: (context, state) {
               if (cubit.getFavoriteModel == null) {
                 return const Center(child: CircularProgressIndicator(color: Colors.teal));
               }

               if(cubit.getFavoriteModel!.data!.data!.isEmpty || cubit.getFavoriteModel == null){
                 return Center(
                   child: MyText(
                       text: 'This page is empty'.tr()),
                 );
               }
              return cubit.getFavoriteModel != null ? ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => FavoriteItem(
                  detum: cubit.getFavoriteModel!.data!.data![index].product,

                  onPressed: () {

                 //   HomeCubit.get(context).changeFavorite(id: cubit.productModel!.data!.data![index].id!);

                  },
                ),
                separatorBuilder: (context, index) => SizedBox(height: 10.h,),
                itemCount: cubit.getFavoriteModel!.data!.data!.length,
              ):const Center(child: CircularProgressIndicator(color: Colors.teal,));

             },

           ),

        //                BlocBuilder(
        //                  bloc: cubit,
        //                  builder: (context, state) {
        //                    if (cubit.listFavorite!.isEmpty) {
        //                      return const Center(
        //                        child: CircularProgressIndicator(color: Colors.teal,),
        //                      );
        //                    } else {
        //                      if (cubit.getFavoriteProductModel!.data!.data!.isEmpty) {
        //                        return Center(
        //                          child: MyText(text:'This page is empty'.tr(),fontWeight: FontWeight.bold,fontSize: 20.sp,),
        //                        );
        //                      } else {
        //                        return ListView.separated(
        //                          shrinkWrap: true,
        //                          physics: const NeverScrollableScrollPhysics(),
        //                          itemBuilder: (context, index) => FavoriteItem(
        //                            userData: cubit.listFavorite![index],
        //
        // onPressed: () {HomeCubit.get(context).changeFavorite(id: cubit.getFavoriteProductModel!.data!.data![index].id!);
        //                            },
        //                          ),
        //                          separatorBuilder: (context, index) => SizedBox(height: 10.h,),
        //                          itemCount: cubit.getFavoriteProductModel!.data!.data!.length,
        //                        );
        //                      }
        //                    }
        //                  },
        //                )

               ],
             ),
           ),
         ),




       );
      },
    );
  }
}
