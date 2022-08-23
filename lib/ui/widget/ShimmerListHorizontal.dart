import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListHorizontal extends StatelessWidget {
  final bool status;
  final int size;
  final Widget child;
  final double sizebox;

  const ShimmerListHorizontal(
      {Key? key,
      required this.status,
      required this.size,
      required this.child,
      required this.sizebox})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade100,
      period: Duration(seconds: 3),
      enabled: status,
      direction: ShimmerDirection.ltr,
      child: SizedBox(
        height: sizebox,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: size,
            itemBuilder: (_, index) {
              return child;
            }),
      ),
    );
  }
}
