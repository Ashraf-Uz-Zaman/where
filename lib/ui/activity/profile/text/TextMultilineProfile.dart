import 'package:flutter/material.dart';
import 'package:where/utils/ColorUtils.dart';

class TextMultilineProfile extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final TextInputType type;
  final bool notVisibleText;
  final bool edit;
  final String? error;
  final onTap;
  final bool visible;
  final bool dividerVisible;

  const TextMultilineProfile(
      {Key? key,
        required this.title,
        required this.controller,
        required this.type,
        required this.notVisibleText,
        this.error,
        required this.edit,
        this.onTap,
        required this.visible,
        required this.dividerVisible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: dividerVisible,
          child: Divider(
            thickness: 1,
            color: Colors.grey.shade600,
          ),
        ),
        SizedBox(height: 7),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title + ":",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
              maxLines: 1,
            ),
            Visibility(
              visible: visible,
              child: InkWell(
                onTap: onTap,
                child: Container(
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  child: Text(edit ? "Done" : "Edit",
                      style: TextStyle(
                          fontSize: 13,
                          color: ColorUtils.colorAppDefaultBlue,
                          fontWeight: FontWeight.w600)),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 2),
        TextFormField(
          controller: controller,
          keyboardType: type,
          enabled: edit,
          obscureText: notVisibleText,
          cursorColor: Colors.white,
          textAlign: TextAlign.start,
          maxLines: 4,
          style: edit
              ? TextStyle(fontSize: 15, color: Colors.yellow)
              : TextStyle(fontSize: 15, color: Colors.white),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorUtils.colorAppDefaultBlue)),
            filled: true,
            fillColor: Colors.black,
            hintText: title,
            hintStyle: TextStyle(fontSize: 15, color: Colors.white70),
            errorText: error,
          ),
        ),
      ],
    );
  }
}