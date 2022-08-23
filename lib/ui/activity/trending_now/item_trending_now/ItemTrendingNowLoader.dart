import 'package:flutter/material.dart';
import 'package:where/ui/widget/ShimmerGridVertical.dart';

class ItemTrendingNowLoader extends StatelessWidget {
  final bool status;

  const ItemTrendingNowLoader({Key? key, required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerGridVertical(status: status, size: 10, aspectRatios: 1.15,child: Container(

      margin: EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(4),
      ),


    ) );


  }
}