import 'package:flutter/material.dart';
import 'package:where/utils/ColorUtils.dart';

class Follow extends StatelessWidget{
  final String title;
  final String quantity;
  final icons;

  const Follow({Key? key, required this.title,required this.icons,required this.quantity})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icons,
          color: ColorUtils.colorAppDefaultBlue,
          size: 32,
        ),
        SizedBox(
          width: 3,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              quantity,
              style: TextStyle(fontSize: 16, color: Colors.white),
            )
          ],
        )
      ],
    );
  }
}