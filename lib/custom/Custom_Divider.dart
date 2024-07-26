import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
 const  CustomDivider({super.key,this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Divider(
          height: 0,
          thickness: 1,
          indent: 10,
          endIndent: 10,
          color: color
      );
    }
}

