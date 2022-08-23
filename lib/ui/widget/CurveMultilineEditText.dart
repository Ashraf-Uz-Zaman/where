import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurveMultilineEditText extends StatelessWidget {
  final String hints;
  final TextEditingController controller;
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;

  const CurveMultilineEditText({
    Key? key,
    required this.hints,
    required this.controller, this.left, this.right, this.top, this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      controller: controller,
      maxLines: 5,
      autofocus: false,
      obscureText: false,
      cursorColor: Colors.white,
      style: TextStyle(fontSize: 15, color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: top ?? 10, bottom: bottom ?? 10, left: left ?? 10, right: right ?? 10),
        filled: true,
        fillColor: Colors.grey.shade800,
        hintText: hints,
        hintStyle: TextStyle(fontSize: 15, color: Colors.white70),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}