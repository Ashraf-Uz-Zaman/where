import 'package:flutter/material.dart';

class TextUtils {
  TextStyle CurveTextStyle() {
    return TextStyle(fontSize: 15, color: Colors.white);
  }

  InputDecoration CurveInputIconDecoration(String hints) {
    return InputDecoration(
      contentPadding:
      EdgeInsets.only(top: 5, bottom: 5, left: 8, right: 10),
      filled: true,
      fillColor: Colors.grey.shade800,
      hintText: hints,
      prefixIcon: Icon(
        Icons.search,
        color: Colors.white,
      ),
      hintStyle: TextStyle(fontSize: 15, color: Colors.white70),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
      ),

    );
  }




  TextStyle CurveButtonTextStyle() {
    return  TextStyle(fontSize: 15, color: Colors.white);
  }
}
