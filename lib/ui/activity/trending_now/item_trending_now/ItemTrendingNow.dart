import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemTrendingNow extends StatelessWidget {
  final String img;

  const ItemTrendingNow({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 5),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.network(
              img,
              fit: BoxFit.fill,

            ),),);
  }
}
