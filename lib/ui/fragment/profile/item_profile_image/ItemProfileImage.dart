
import 'package:flutter/material.dart';

class ItemProfileImage extends StatelessWidget {
  final String img;
  final Color color;


  const ItemProfileImage({Key? key, required this.img,required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: color, width: 2),
            ),
            child: Image.network(
              img,
              height: 85,
              width: 85,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 1)),
            ),
          ),
        ],
      ),
    ]);
  }
}