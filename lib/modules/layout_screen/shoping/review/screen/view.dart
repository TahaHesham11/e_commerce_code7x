import 'package:e_commerce_code7x/custom/custom_app_bar.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/review/screen/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/review/screen/bloc/states.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/review/screen/components/review_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewsScreen extends StatelessWidget {
  final int id;
  const ReviewsScreen({super.key,required this.id
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>ReviewCubit()..getReview(id: id),

      child: BlocConsumer<ReviewCubit,ReviewStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = ReviewCubit.get(context);
          return Scaffold(
              appBar: CustomAppBar(
                text: MyText(
                  text: 'Comments'.tr(),
                ),
              ),


              body: BlocBuilder<ReviewCubit,ReviewStates>(
                bloc: cubit,
                builder: (context, state) {
                 return  cubit.reviewModel != null ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return  ReviewItem(
                        data: cubit.reviewModel!.data![index],);
                    },
                    itemCount: cubit.reviewModel!.data!.length,
                  ):const Center(child: CircularProgressIndicator(color: Colors.transparent,));
                },
              )
          );
        },
      ),
    )  ;
  }
}
