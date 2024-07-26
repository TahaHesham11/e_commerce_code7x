// import 'package:e_commerce_code7x/custom/my_text.dart';
// import 'package:e_commerce_code7x/modules/layout_screen/home/bloc/cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class ShowBottom extends StatefulWidget {
//   final int index;
//   final List<String> words; // قائمة الكلمات
//
//   const ShowBottom({super.key, required this.index, required this.words,});
//
//   @override
//   State<ShowBottom> createState() => _ShowBottomState();
// }
//
// class _ShowBottomState extends State<ShowBottom> {
//   late List<bool> isCheckedList;
//
//   @override
//   void initState() {
//     super.initState();
//     isCheckedList = List.generate(widget.words.length, (index) => false);
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder(
//       bloc: HomeCubit.get(context),
//       builder: (context, state) {
//         return Column(
//           children: List.generate(widget.words.length, (index) {
//             return Container(
//               margin: EdgeInsets.symmetric(vertical: 10.r, horizontal: 10.r),
//               padding: EdgeInsetsDirectional.all(5.r),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     offset: const Offset(0, -3),
//                     blurRadius: 8,
//                     spreadRadius: 0,
//                   ),
//                 ],
//               ),
//               child: Row(
//                 children: [
//                   MyText(text: widget.words[index]),
//                   const Spacer(),
//                   Checkbox(
//                     value: isCheckedList[index],
//                     activeColor: Colors.teal,
//                     checkColor: Colors.transparent,
//                     onChanged: (value) {
//
//                       setState(() {
//
//                         for (int i = 0; i < isCheckedList.length; i++) {
//                           isCheckedList[i] = false;
//                         }
//                         if (index == 2) {
//                           HomeCubit.get(context).fetchFilterPrice(isAscending: false);
//                         } else if (index == 3) {
//                           HomeCubit.get(context).fetchFilterPrice(isAscending: true);
//                         }
//                         isCheckedList[index] = value!; // تحديث قيمة isCheckedList[index]
//
//                       });
//
//                     },
//                   ),
//
//
//                 ],
//               ),
//             );
//           }),
//         );
//       },
//     );
//   }
// }
//
//
