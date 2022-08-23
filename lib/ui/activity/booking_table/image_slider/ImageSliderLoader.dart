import 'package:flutter/material.dart';
import 'package:where/ui/widget/ShimmerSingle.dart';

class ImageSliderLoader extends StatelessWidget {
  final bool status;

  const ImageSliderLoader({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerSingle(
      status: status,
      child: Container(
        height: 175,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    );
  }
}
