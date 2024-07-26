import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/custom/custom_app_bar.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/bloc/states.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/screen/Products/screen/filter_product/components/filter_item.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class FilterProduct extends StatefulWidget {

  const FilterProduct({super.key, });

  @override
  State<FilterProduct> createState() => _FilterProductState();
}

class _FilterProductState extends State<FilterProduct> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {

        final cubit = HomeCubit.get(context);
        return  Scaffold(
            appBar: const CustomAppBar(
              text: MyText(
                text: 'Filter Product',
              ),
            ),

          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [


                BlocBuilder<HomeCubit, HomeStates>(
                  bloc: cubit,
                  builder: (context, state) {
                    if (state is GetOneCategoryLoadingState) {

                      return const Center(child: CircularProgressIndicator(color: Colors.teal));

                    } else if (cubit.getOneCategories == null) {

                      return const Center(child: CircularProgressIndicator(color: Colors.teal));

                    } else if (cubit.getOneCategories!.data!.dataCategories!.isEmpty) {

                      return const Center(
                        child: MyText(text: 'This page is empty'),
                      );
                    } else {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8.0.h,
                          crossAxisSpacing: 8.0,
                          childAspectRatio: 1 / 1.6,
                        ),
                        itemCount: cubit.getOneCategories!.data!.dataCategories!.length,
                        itemBuilder: (context, index) {
                          return FilterItem(
                            onPressed: () {
                              navigateAndFinish(
                                context,
                                ShoppingScreen(
                                  catId: cubit.productModel!.data!.data![index].categories!.first.id,

                                  dataProduct: cubit.productModel!.data!.data![index],
                                ),
                              );
                            },
                            onFavoritePressed: () {
                              setState(() {
                                cubit.changeFavorite(
                                  id: cubit.productModel!.data!.data![index].id!,
                                );
                                cubit.productModel!.data!.data![index].isFavourite = !cubit.productModel!.data!.data![index].isFavourite;
                              });
                            },
                            userData: cubit.productModel!.data!.data![index],
                            subCategories: cubit.getOneCategories!.data!.dataCategories![index],
                          );
                        },
                      );
                    }
                  },
                )


              ],
            ),
          ),
        );

      },
          );
  }
}
