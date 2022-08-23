import 'package:flutter/material.dart';

class ImageSliderEmpty extends StatelessWidget {
final onBackPress;

const ImageSliderEmpty({Key? key, required this.onBackPress}) : super(key: key);

@override
Widget build(BuildContext context) {
  return Stack(children: [ Container(
      height: 175,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(7),
      ),

  ),
    Positioned(
      left: 0,
      top: 10,
      child: InkWell(
        onTap: onBackPress,
        child: Container(
          padding: EdgeInsets.all(5),
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
            size: 32,
          ),
        ),
      ),
    ),
    Positioned(
      left: 7,
      bottom: 50,
      child:  Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.4),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
            size: 24,
          ),

      ),
    ),
    Positioned(
      right: 7,
      bottom: 50,
      child:  Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.4),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
            size: 24,
          ),

      ),
    ),
  ],);
}

}