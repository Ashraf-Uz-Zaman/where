import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:where/ui/widget/ShimmerListVertical.dart';

class ItemLocationLoader extends StatelessWidget {
  final bool status;

  const ItemLocationLoader({Key? key, required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerListVertical(status: status,
      size: 7,
      child: Container(
          margin: EdgeInsets.only(
              top: 20,
              left: 15,
              right: 15,
              bottom: 10
          ),
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 65,
                width: 65,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(
                width: 10,
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 2),
                    height: 15,
                    width: 160,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    height: 11,
                    width: 97,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              )
            ],
          )
      ),

    );
  }
}