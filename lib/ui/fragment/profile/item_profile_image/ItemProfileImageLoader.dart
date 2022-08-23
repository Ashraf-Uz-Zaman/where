import 'package:flutter/material.dart';
import 'package:where/ui/widget/ShimmerSingle.dart';

class ItemProfileImageLoader extends StatelessWidget {
  final bool status;

  const ItemProfileImageLoader({Key? key, required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerSingle(
      status: status,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                height: 89,
                width: 89,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(7),
                ),

              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                ),
              ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
