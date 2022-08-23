import 'package:flutter/material.dart';
import 'package:where/ui/widget/ShimmerListHorizontal.dart';

class ItemCategoriesLoader extends StatelessWidget {
  final bool status;

  const ItemCategoriesLoader({Key? key, required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ShimmerListHorizontal(
          status: status,
          size: 3,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              height: 90,
              width: 90,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(9),
              ),
            ),
          ),
          sizebox: 100),
    );
  }
}
