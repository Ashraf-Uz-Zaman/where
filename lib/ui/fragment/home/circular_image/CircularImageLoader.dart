import 'package:flutter/material.dart';
import 'package:where/ui/widget/ShimmerListHorizontal.dart';

class CircularImageLoader extends StatelessWidget {

  final bool status;


  const CircularImageLoader(
      {Key? key,required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerListHorizontal(
      status: status,
      size: 5,
      sizebox: 100,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
             CircleAvatar(
              radius: 32,
              backgroundColor: Colors.grey[300],
            ),
            SizedBox(
              height: 5,
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 12,
                  width: 63,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
