import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerGridVertical extends StatelessWidget {
  final bool status;
  final int size;
  final Widget child;
  final double aspectRatios;

  const ShimmerGridVertical(
      {Key? key,
      required this.status,
      required this.size,
      required this.child,
      required this.aspectRatios})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade100,
      period: Duration(seconds: 3),
      enabled: status,
      direction: ShimmerDirection.ltr,
      child: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 3,
        padding: const EdgeInsets.all(8),
        crossAxisSpacing: 5,
        shrinkWrap: true,
        mainAxisSpacing: 5,
        childAspectRatio: aspectRatios,
        children: List.generate(
          size,
          (index) {
            return child;
          },
        ),
      ),
    );
  }
}
