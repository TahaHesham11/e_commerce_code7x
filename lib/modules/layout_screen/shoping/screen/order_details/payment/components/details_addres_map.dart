import 'package:e_commerce_code7x/custom/my_button.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/screen/order_details/screen/compelete_address/bloc/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../models/address_model.dart';

class DetailsAddress extends StatefulWidget {
  final bool isChecked;
  final AddressData addressModel;
  final void Function(bool?)? onCheckedChanged;

  const DetailsAddress({
    super.key,
    required this.isChecked,
    required this.addressModel,
    required this.onCheckedChanged,
  });

  @override
  State<DetailsAddress> createState() => _DetailsAddressState();
}

class _DetailsAddressState extends State<DetailsAddress> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(top: 18.0.r),
          child: Row(
            children: [
              Checkbox(
                activeColor: widget.isChecked ? Colors.teal : Colors.transparent,
                value: widget.isChecked,
                shape: const CircleBorder(),
                onChanged: (value) {
                  widget.onCheckedChanged!(value);

                },
              ),

              // Checkbox(
              //   activeColor: widget.isChecked ? Colors.teal : Colors.transparent,
              //   value: widget.isChecked,
              //   shape: const CircleBorder(),
              //
              //   onChanged: (value) {
              //     widget.onCheckedChanged!(value);
              //   },
              // ),
              Expanded(flex: 2, child: MyText(text: widget.addressModel.title!)),
              Expanded(
                flex: 1,
                child: MyButton(
                  width: 66.w,
                  height: 30.h,
                  textColor: const Color(0xff7960A5),
                  background: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 0,
                      blurRadius: 0,
                      offset: Offset(0, 0),
                    )
                  ],
                  border: Border.all(color: const Color(0xff7960A5)),
                  onPressed: () {},
                  text: 'تعديل',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}