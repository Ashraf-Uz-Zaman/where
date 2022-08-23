import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImage extends StatelessWidget {
  final String img;
  final Color color;
  final bool type;
  final XFile? image;

  const ProfileImage(
      {Key? key,
      required this.img,
      required this.color,
      required this.type,
      this.image})
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
            child: type
                ? Image(
                    image: AssetImage(
                      image!.path,
                    ),
                    height: 68,
                    width: 68,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    img,
                    height: 68,
                    width: 68,
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
