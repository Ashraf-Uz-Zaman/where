import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:where/ui/widget/ShimmerListHorizontal.dart';

class ItemWhereLoader extends StatelessWidget {
  final bool status;

  const ItemWhereLoader({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 4),
      alignment: Alignment.topLeft,
      child: ShimmerListHorizontal(
        status: status,
        size: 4,
        sizebox: 90,
        child: Container(
          height: 70,
          width: 110,
          margin: EdgeInsets.only(left: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
