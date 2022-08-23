import 'package:flutter/material.dart';
import 'package:where/utils/ColorUtils.dart';

class TextProfile extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final TextInputType type;
  final bool notVisibleText;
  final bool edit;
  final String? error;
  final onTap;
  final bool visible;
  final bool dividerVisible;

  const TextProfile(
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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(
              width: 2,
            ),
            Flexible(
              child: TextFormField(
                controller: controller,
                keyboardType: type,
                enabled: edit,
                obscureText: notVisibleText,
                cursorColor: Colors.white,
                maxLines: 1,
                style: edit
                    ? TextStyle(fontSize: 15, color: Colors.yellow)
                    : TextStyle(fontSize: 15, color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  border: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorUtils.colorAppDefaultBlue)),
                  filled: true,
                  fillColor: Colors.black,
                  hintText: title,
                  hintStyle: TextStyle(fontSize: 15, color: Colors.white70),
                  errorText: error,
                ),
              ),
            ),
            SizedBox(
              width: 2,
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
      ],
    );
  }
}
