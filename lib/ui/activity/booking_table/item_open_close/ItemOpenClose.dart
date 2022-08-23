import 'package:flutter/material.dart';
import 'package:where/ui/widget/CustomeText.dart';
import 'package:where/utils/ColorUtils.dart';

class ItemOpenClose  extends StatelessWidget {
  final String weekName;
  final String time;
  const ItemOpenClose({Key? key, required this.weekName,required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 7),
      child: Row(children: [
        Flexible(child: Row(children: [Icon(Icons.calendar_today_outlined,color: ColorUtils.colorAppDefaultBlue,size: 15,),
          SizedBox(width: 5,),
          CustomeText(title: weekName,size: 12.5,left: 0,right: 0,),],)),

        Spacer(),
        Flexible(child: Row(
          children: [ Icon(Icons.access_time,color: ColorUtils.colorAppDefaultBlue,size: 15,),
          SizedBox(width: 5,),
          CustomeText(title: time,size: 12.5,left: 0,right: 0,),],))

      ],),
    );
  }
}