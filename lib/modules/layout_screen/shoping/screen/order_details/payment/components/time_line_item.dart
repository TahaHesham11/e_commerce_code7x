import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLineItem extends StatelessWidget {
  final String title;
  final bool isFirst;
  final bool isLast;
  final bool isCompleted;
  final bool isCurrentScreen;

  TimeLineItem({
    super.key,
    required this.title,
    required this.isFirst,
    required this.isLast,
    required this.isCompleted,
    required this.isCurrentScreen,
  });

  @override
  Widget build(BuildContext context) {
    Color indicatorColor;
    if (isCurrentScreen) {
      indicatorColor =  Colors.green;
    } else if (isCompleted) {
      indicatorColor = const Color(0xff7960A5);
    } else {
      indicatorColor = Colors.grey;
    }

    return TimelineTile(
      axis: TimelineAxis.horizontal,
      alignment: TimelineAlign.manual,
      lineXY: 0.1,
      indicatorStyle: IndicatorStyle(
        width: 20.w,
        color: indicatorColor,
        iconStyle: IconStyle(
          fontSize: 20.sp,
          iconData: Icons.check,
          color: Colors.white,
        ),
      ),
      beforeLineStyle:  LineStyle(
        color: indicatorColor,
        thickness: 2,
      ),
      afterLineStyle: LineStyle(
        color: indicatorColor,
        thickness: 2,
      ),
      endChild: Padding(
        padding: EdgeInsets.all(12.0.r),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 12.0.sp,
            color: indicatorColor,
          ),
        ),
      ),
    );
  }
}
