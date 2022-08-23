import 'package:flutter/material.dart';
import 'package:where/utils/ColorUtils.dart';

class ItemCategories extends StatelessWidget {
  final String img;
  final String name;
  final bool status;

  const ItemCategories({Key? key, required this.img, required this.name,  required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        height: 90,
        width: 90,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: status ? ColorUtils.colorAppDefaultBlue:Colors.black,
            borderRadius: BorderRadius.circular(9),
            border: Border.all(color: Colors.grey, width: 2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(img,height: 24,width: 24,color: Colors.white,),
            SizedBox(height: 5),
            Align(
              alignment: Alignment.center,
              child: Text(name, style: TextStyle(color: Colors.white,fontSize: 11),textAlign: TextAlign.center,),
            )

          ],
        )
        ),
    );
  }
}
