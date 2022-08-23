

import 'package:flutter/material.dart';

class CurveDropDown extends StatelessWidget {
  final value;
  final list;
  final  change;

  const CurveDropDown({
    Key? key,
    required this.value,
    required this.list,
    required this.change,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(24),
        ),
        child: DropdownButton(
        style: TextStyle(fontSize: 15.0, color: Colors.white),
    elevation: 3,
    iconSize: 30.0,
    iconEnabledColor: Colors.white,
    isExpanded: true,
    dropdownColor: Colors.grey,
    underline: Container(),
    value: value,
    items: list,
    onChanged: change,
    hint: Container(
    child: Text("Select item"),
    alignment: Alignment.center,
    ),),);
  }
}