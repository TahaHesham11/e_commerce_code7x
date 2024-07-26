import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Rating extends StatelessWidget {
   void Function(double) onRatingUpdate;
   double initialRating;
   Rating({super.key,required this.onRatingUpdate,required this.initialRating});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(

      itemSize: 15.sp,
      initialRating: initialRating,
      minRating: 0.5,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        size: 1.sp,
        color: Colors.amber,
      ),
      onRatingUpdate: onRatingUpdate

    );
  }
}
