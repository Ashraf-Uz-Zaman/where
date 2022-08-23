import 'package:flutter/material.dart';

class CustomeText extends StatelessWidget {
  final String title;
  final double? size;
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  final  colors;
  final alingment;
  final justify;

  const CustomeText({Key? key, required this.title, this.size, this.left, this.right, this.top, this.bottom, this.colors, this.alingment, this.justify,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: left?? 0, right: right?? 0 ,top: top?? 0,bottom: bottom?? 0),
        alignment: alingment?? Alignment.topLeft,
        child: Text(
          title,
          textAlign: justify ?? null,
          style: TextStyle(
            fontSize: size ?? 14.5 ,
            color: colors ?? Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ));
  }
}