// import 'package:e_commerce_code7x/custom/my_text.dart';
// import 'package:e_commerce_code7x/models/product_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class ProductsItem extends StatefulWidget {
//   final  DataProduct userData;
//
//   const ProductsItem({super.key,required this.userData});
//
//   @override
//   State<ProductsItem> createState() => _ProductsItemState();
// }
//
// class _ProductsItemState extends State<ProductsItem> {
//   bool isFavorite = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return           Container(
//       margin: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
//       padding: EdgeInsets.all(10.r),
//       width: double.infinity,
//       height: 150.h,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.r),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.3),
//             offset: const Offset(0, -3),
//             blurRadius: 8,
//             spreadRadius: 0,
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.white38.withOpacity(0.1),
//                   offset: const Offset(0, 5),
//                   blurRadius: 9,
//                   spreadRadius: 0,
//                   blurStyle: BlurStyle.normal,
//                 ),
//               ],
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(15.r),
//               child: Image.network(
//                 '${widget.userData.coverImage}',
//                 fit: BoxFit.cover,
//                 width: 100.w,
//                 height: 140.0.h,
//               ),
//             ),
//             padding: EdgeInsets.all(10.r),
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsetsDirectional.only(start: 5.0.r, end: 10.r),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   MyText(
//                     text: '${widget.userData.name}',
//                     fontWeight: FontWeight.bold,
//                     maxLine: 2,
//                     fontSize: 16.sp,
//                   ),
//                   SizedBox(
//                     width: 135.h,
//                     child: Padding(
//                       padding: EdgeInsetsDirectional.only(bottom: 10.r),
//                       child: MyText(
//                         overflow: TextOverflow.ellipsis,
//                         maxLine: 2,
//                         softWrap: true,
//                         text: widget.userData.descriptionWithoutHtml!,
//                         color: Colors.grey,
//                         fontSize: 12.sp,
//                       ),
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       if(widget.userData.price != null)
//                       MyText(
//                         text: '${widget.userData.price}',
//                         fontSize: 12.sp,
//                         color: Colors.black,
//                       ),
//                       SizedBox(width: 5.w,),
//                       if(widget.userData.discountedPrice !=0 && widget.userData.discountedPrice !=null)
//
//                         MyText(
//                         text: '${widget.userData.discountedPrice}',
//                         fontSize: 12.sp,
//                         color: Colors.grey,
//                         decoration: TextDecoration.lineThrough,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 margin: EdgeInsetsDirectional.only(top: 10.r),
//                 height: 35.h,
//                 width: 35.w,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8.r),
//                   color: Colors.teal,
//                 ),
//                 child: IconButton(
//                   onPressed: () {
//                     setState(() {
//                       isFavorite = !isFavorite;
//                     });
//                   },
//                   icon: Icon(
//                     isFavorite ? Icons.favorite : Icons.favorite_border,
//                     size: 18.sp,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//            const Spacer(), // فراغ بين الأيقونات
//               Container(
//                 height: 35.h,
//                 width: 35.w,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8.r),
//                   color: Colors.teal,
//                 ),
//                 child: IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.add,
//                     size: 18.sp,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//
//
//   }
// }
