import 'package:flutter/material.dart';
import 'package:where/utils/ColorUtils.dart';

class CurveEditText extends StatelessWidget {
  final String hints;
  final TextInputType? type;
  final bool? notVisibleText;
  final bool transparent;
  final String? error;
  final  style;
  final TextEditingController controller;
  final double? font_size;

  const CurveEditText({
    Key? key,
    required this.hints,
   this.notVisibleText,required this.transparent, this.type,  this.error,
    required this.controller, this.style, this.font_size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type ?? TextInputType.text,
      autofocus: false,
      obscureText: notVisibleText ?? false,
      cursorColor: Colors.white,
      style: TextStyle(fontSize: font_size?? 15, color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 15),
        filled: true,
        fillColor: transparent ? ColorUtils.colorTanspatentBlack62:Colors.grey.shade800,
        hintText: hints,
        hintStyle: TextStyle(fontSize: font_size?? 15, color: Colors.white70),
        errorText: error,
       prefixIcon: style ?? null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}
