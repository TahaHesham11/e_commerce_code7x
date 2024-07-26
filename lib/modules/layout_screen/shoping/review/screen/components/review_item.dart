import 'package:e_commerce_code7x/custom/custom_rating.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../models/review_model.dart';

class ReviewItem extends StatelessWidget {
  final ReviewData? data;
  const ReviewItem({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(12.0.r),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.grey[200],
        ),
        height: 100.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.symmetric(horizontal: 10.r,vertical: 10.r),

                  child: CircleAvatar(
                    radius: 30.r,
                    backgroundColor: Colors.white,

                    child: CircleAvatar(
                      radius: 28.r,
                      backgroundImage:  const AssetImage(
                        'assets/images/account.png',

                      ),

                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     MyText(text: data!.createdAt!),
                    Rating(
                        initialRating:  data!.rating!.toDouble(),

                        onRatingUpdate: (double rating){}
                    )

                  ],
                ),

              ],
            ),
            if(data!.comment != null)
            MyText(text: data!.comment!),
          ],
        ),
      ),
    );
  }
}
