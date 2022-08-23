import 'package:flutter/material.dart';

class ItemMessage extends StatelessWidget {
  final String img;
  final bool status;
  final bool online;
  final String name;
  final String sur_name;
  final String location;

  const ItemMessage(this.status,
      {Key? key, required this.img, required this.online, required this.name, required this.sur_name, required this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
                child: image()),
            SizedBox(width: 6,),
            Flexible(
              flex: 4,
                child: details()),
            Flexible(
                flex: 1,child: edit())
          ],
        ));
  }

  Widget image() {
    return Column(children: [
      Stack(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                border: status
                    ? Border.all(color: Colors.blue, width: 2)
                    : Border.all(color: Colors.grey, width: 2)),
            child: Image.asset(img,
              height: 90,
              width: 90,
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
                      color: online ? Colors.green : Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white, width: 1)),
                ),
          ),
        ],
      ),

    ]);
  }
  Widget details() {
    return Column(children: [
      Container(
        margin: EdgeInsets.only(top: 6),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w500),),
            SizedBox(height: 3,),
            Text(sur_name,style: TextStyle(fontSize: 15,color: Colors.white),),
            SizedBox(height: 9,),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.white54,
                  size: 13,
                ),
                SizedBox(width: 4),
                Text(
                  location,
                  style: TextStyle(fontSize: 15.0, color: Colors.white54),
                )
              ],
            )
          ],
        ),
      )

    ]);
  }

  Widget edit() {
    return
       Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: Icon(Icons.edit,size: 24,color: Colors.white,),
            onPressed: () {  },
          ),

    );
  }
}
