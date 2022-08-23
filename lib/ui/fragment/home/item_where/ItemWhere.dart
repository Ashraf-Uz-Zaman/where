
import 'package:flutter/material.dart';

class ItemWhere extends StatelessWidget {
  final String img;


  const ItemWhere({Key? key, required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            img,
            fit: BoxFit.cover,
            height: 70,
            width: 110,
          )),
    );
  }
}