import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerSingle extends StatelessWidget {
  final bool status;
  final Widget child;

  const ShimmerSingle({Key? key, required this.status, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade100,
      period: Duration(seconds: 3),
      enabled: status,
      direction: ShimmerDirection.ltr,
      child: child

      );
  }
}
