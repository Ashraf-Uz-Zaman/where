import 'package:flutter/material.dart';
import 'package:where/utils/ColorUtils.dart';

class CurveColorButton extends StatelessWidget{
  final String name;
  final VoidCallback pressAction;

 const CurveColorButton(
     {Key? key,
       required this.name,required this.pressAction})
     : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(name, style: TextStyle(fontSize: 15, color: Colors.white)),
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.only(top: 12, bottom: 12, left: 35, right: 35),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor:
            MaterialStateProperty.all<Color>(ColorUtils.colorAppDefaultBlue),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      onPressed: pressAction,
    );
  }
}
