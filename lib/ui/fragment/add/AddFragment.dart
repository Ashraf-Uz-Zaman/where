
import 'package:flutter/material.dart';
import 'package:where/utils/ImageUtils.dart';
import 'package:where/utils/StringValueUtils.dart';

class AddFragment extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<AddFragment> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Image.asset(
            ImageUtils.WHERE_LOGO,
            fit: BoxFit.contain,
            height: 47,
          ),
          centerTitle: true,
        ),
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(top: 12),
        child: Column(
          children: [
            topSideField()
          ],
        ),
      )
    ));
  }

  Widget topSideField() {
    return Row(
      children: [
        Flexible(
            flex: 1,
            child: InkWell(
              onTap: () { print("sdff");},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(StringValueUtils.VIDEO,style: TextStyle(
                      fontSize: 14,color: Colors.white
                  ),
                  ),SizedBox(width: 3,),
                  Icon(Icons.video_call_rounded, color: Colors.white,size: 22,)
                ],
              ),
            )),
        Flexible(
            flex: 1,
            child: InkWell(
              onTap: () { print("sdff");},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(StringValueUtils.PHOTO,style: TextStyle(
                      fontSize: 14,color: Colors.white
                  ),
                  ),SizedBox(width: 3,),
                  Icon(Icons.image, color: Colors.white,size: 24,)
                ],
              ),
            )),
        Flexible(
            flex: 1,
            child: InkWell(
              onTap: () { print("sdff");},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(StringValueUtils.ACITIVITY,style: TextStyle(
                      fontSize: 14,color: Colors.white
                  ),
                  ),SizedBox(width: 3,),
                  Icon(Icons.emoji_emotions_outlined, color: Colors.white,size: 22,)
                ],
              ),
            )),
      ],
    );
  }
}