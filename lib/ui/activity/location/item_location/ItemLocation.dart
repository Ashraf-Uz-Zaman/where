import 'package:flutter/material.dart';

class ItemLocation extends StatelessWidget {
  final String img;
  final String name;
  final String location;

  const ItemLocation({Key? key, required this.img, required this.name,  required this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Flexible(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  img,
                  fit: BoxFit.fill,
                  height: 65,
                  width: 65,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(children: <Widget>[
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.white54,
                        size: 12,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        location,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white54,
                            fontWeight: FontWeight.w500),
                      ),
                    ])
                  ],
                ))
          ],
        ));
  }
}
