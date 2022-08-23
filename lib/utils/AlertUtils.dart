import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AlertUtils {
  AlertStyles() {
    return AlertStyle(
      titleStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          fontSize: 18),
      descStyle:  TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          fontSize: 15),
      isCloseButton: false,
      buttonsDirection: ButtonsDirection.column,

    );
  }

  AlertStylesHorizontal() {
    return AlertStyle(
      titleStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          fontSize: 18),
      descStyle:  TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          fontSize: 15),
      isCloseButton: false,
      buttonsDirection: ButtonsDirection.row,

    );
  }
}
