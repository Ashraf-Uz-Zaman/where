import 'package:flutter/material.dart';
import 'package:where/ui/widget/ShimmerGridVertical.dart';

class ItemTopPicksLoader extends StatelessWidget {
  final bool status;

  const ItemTopPicksLoader({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
    margin: EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 10),
               child : ShimmerGridVertical(status: status, size: 10, aspectRatios: 1,child: Column(
                 children: [
                   Container(
                     height: 82,
                     width: 120,
                     decoration: BoxDecoration(
                       color: Colors.black,
                       borderRadius: BorderRadius.circular(4),
                     ),
                   ),
                   SizedBox(
                     height: 3,
                   ),
                   Container(
                     margin: EdgeInsets.only(left: 5),

                     alignment: Alignment.topLeft,

                     child: Container(
                       height: 12,
                       width: 48,
                       decoration: BoxDecoration(
                         color: Colors.black,
                         borderRadius: BorderRadius.circular(2),
                       ),
                     ),

                   ),
                 ],
               ),),



    );
  }
}
