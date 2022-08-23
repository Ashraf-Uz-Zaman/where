import 'package:flutter/material.dart';
import 'package:where/utils/ScreenResulationUtils.dart';

class SliderPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;


  SliderPage(
      {required this.title, required this.description, required this.image});

  @override
  Widget build(BuildContext context) {

    double height = ScreenResulationUtils.HEIGHT*.58;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: height,
          width: ScreenResulationUtils.WIDTH,
          child: Image.asset(image,fit: BoxFit.fill,),),
        // SizedBox(
        //   height: 0,
        // ),
        Padding(
          padding: EdgeInsets.fromLTRB((ScreenResulationUtils.HEIGHT/54.47), (ScreenResulationUtils.WIDTH/35.67), (ScreenResulationUtils.HEIGHT/54.47), (ScreenResulationUtils.WIDTH/71.34)),   //17,12,17,6
        child : Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20,color: Colors.white),
        ),
        ),
        // SizedBox(
        //   height: 0,
        // ),
        Padding(
        padding: EdgeInsets.fromLTRB((ScreenResulationUtils.HEIGHT/54.47), (ScreenResulationUtils.WIDTH/71.34), (ScreenResulationUtils.HEIGHT/54.47), (ScreenResulationUtils.WIDTH/35.67)), //17,6,17,12
        child : Text(description,
            textAlign: TextAlign.center,
            style: TextStyle( fontSize: 15,color: Colors.white,)),
        )
      ],
    );
  }
}
