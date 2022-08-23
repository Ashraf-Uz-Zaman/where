import 'package:flutter/material.dart';
import 'package:where/utils/ColorUtils.dart';

class ButtonUtils {
  ButtonStyle CurveButtonStyle() {
    return ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(
        EdgeInsets.only(top: 12, bottom: 12, left: 35, right: 35),
      ),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      backgroundColor:
          MaterialStateProperty.all<Color>(ColorUtils.colorAppDefaultBlue),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
