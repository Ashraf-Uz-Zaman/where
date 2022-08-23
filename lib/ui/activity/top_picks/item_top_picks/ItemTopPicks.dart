import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemTopPicks extends StatelessWidget {
  final String img;
  final String name;

  const ItemTopPicks({Key? key, required this.img, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Image.network(
            img,
            fit: BoxFit.cover,
            height: 82,
            width: 120,
          ),
        ),
        SizedBox(
          height: 3,
        ),
        Container(
          margin: EdgeInsets.only(left: 5),
          alignment: Alignment.topLeft,
          child: RichText(
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
                style: TextStyle(color: Colors.white, fontSize: 12),
                text: name),
          ),
        ),
      ],
    );
  }
}
