// import 'package:e_commerce_code7x/core/validate.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
//
//
// class ShowTwoDialog extends StatelessWidget {
//  const ShowTwoDialog({
//     super.key,
//     required this.onPressed});
//
//
//  final void Function()? onPressed;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 150.r, horizontal: 10.r),
//       height: 130.h,
//       width: 100.w,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30.r),
//         color: Colors.white,
//
//       ),
//
//       child:    Padding(
//         padding:  EdgeInsets.symmetric(vertical: 20.0.r,horizontal: 20.r),
//         child: PinCodeTextField(
//           textInputAction: TextInputAction.send,
//           validator:    validate(text: 'code'),
//
//           appContext: context,
//           length: 5,
//           autoFocus: true,
//           cursorColor: Colors.black,
//           keyboardType: TextInputType.number,
//           obscureText: false,
//           animationType: AnimationType.scale,
//           pinTheme: PinTheme(
//             shape: PinCodeFieldShape.box,
//             borderRadius: BorderRadius.circular(5.r),
//             fieldHeight: 50.h,
//             fieldWidth: 50.w,
//             borderWidth: 1.0.w,
//             activeFillColor:Colors.grey[200],
//             activeColor: Colors.grey[200],
//             inactiveColor: Colors.grey[200],
//             inactiveFillColor: Colors.white,
//             selectedColor: Colors.grey[200],
//             selectedFillColor: Colors.white,
//
//           ),
//           animationDuration: const Duration(milliseconds: 300),
//           backgroundColor: Colors.white,
//           enableActiveFill: true,
//           onCompleted: (submitCode) {
//           },
//           onChanged: (value) {
//
//           },
//         ),
//       ),
//     );
//   }
// }
