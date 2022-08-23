

import 'package:flutter/material.dart';

class CustomeTextLoader extends StatelessWidget {
  final double? height;
  final double? width;


  const CustomeTextLoader({Key? key, this.height, this.width,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 11,
      width: width ?? 97,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}