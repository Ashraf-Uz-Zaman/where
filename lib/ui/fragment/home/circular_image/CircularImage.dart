import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  final String img;
  final bool status;
  final bool online;
  final String name;
  final Color color;

  const CircularImage(this.status,
      {Key? key, required this.img, required this.online, required this.name,required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35),
                    border: status
                        ? Border.all(color: color, width: 2)
                        : Border.all(color: Colors.white, width: 2)),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: NetworkImage(img),
                ),
              ),
              Positioned(
                right: 2,
                top: 0,
                child: Visibility(
                    visible: online,
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white, width: 1)),
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        Container(
    width: 79,
        child: Text(
           name,
           overflow: TextOverflow.ellipsis,

           maxLines: 1,
           style: TextStyle(
             fontSize: 12,
             color: Colors.white,
           ),
         ),
        ),
        ],
      ),

    );
  }
}
