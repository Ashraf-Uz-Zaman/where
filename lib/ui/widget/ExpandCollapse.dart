import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class ExpandCollapse extends StatelessWidget {
  final String title;
  final double? fontSize;
  final double? left;
  final double? right;
  final Widget expand;
  final Widget collapse;

  const ExpandCollapse({Key? key, required this.title,required this.expand,required this.collapse, this.fontSize, this.left, this.right})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          top: 8,
          left: left ?? 16,
          right: right ?? 16,
        ),
        alignment: Alignment.topCenter,
        child: ExpandablePanel(
          header: Text(title,
              style: TextStyle(
                  fontSize: fontSize ?? 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              softWrap: true),
          collapsed: collapse,
          expanded: expand,
        ),);
  }
}