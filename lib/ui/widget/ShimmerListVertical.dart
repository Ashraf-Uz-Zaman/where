import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListVertical extends StatelessWidget {
  final bool status;
  final int size;
  final Widget child;

  const ShimmerListVertical(
      {Key? key,
      required this.status,
      required this.size,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade100,
      period: Duration(seconds: 3),
      enabled: status,
      direction: ShimmerDirection.ltr,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: size,
        itemBuilder: (_, index) {
          return child;
        },
      ),
    );
  }
}
