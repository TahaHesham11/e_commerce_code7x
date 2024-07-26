import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodItem extends StatefulWidget {
  final String text;
   void Function(bool?)? onChanged;
  final bool isSelected;

  PaymentMethodItem({super.key,required this.text,required this.onChanged,required  this.isSelected});

  @override
  State<PaymentMethodItem> createState() => _PaymentMethodItemState();
}

class _PaymentMethodItemState extends State<PaymentMethodItem> {
  bool isCheck =false;

  @override
  Widget build(BuildContext context) {
    return    GestureDetector(
      onTap: (){
        widget.onChanged!(widget.isSelected);
      },
      child: Container(
        width: 416.w,
        height: 47.h,
        margin: EdgeInsetsDirectional.only(bottom: 20.r),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(20.r)
        ),
        child: Row(
          children: [
            Checkbox(
                activeColor: widget.isSelected ? Colors.teal : Colors.transparent,
                value: widget.isSelected,
                shape: const CircleBorder(),
                onChanged: widget.onChanged

                ),
             MyText(text: widget.text)

          ],
        ),
      ),
    );
  }
}
