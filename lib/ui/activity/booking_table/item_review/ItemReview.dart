import 'package:flutter/material.dart';
import 'package:where/ui/widget/CustomeText.dart';
import 'package:where/utils/DateTimeUtils.dart';

class ItemReview extends StatelessWidget {
  final String title;
  final String review;
  final String name;
  final int date;

  const ItemReview({Key? key, required this.title, required this.review,required this.name,required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 3),
          CustomeText(title: title),
          SizedBox(height: 3),
          CustomeText(title: review,size: 13.3,),
          SizedBox(height: 3),
          CustomeText(title: "By "+ name+", "+DateTimeUtils.dateTimestamp(date),size: 11.6,colors: Colors.white54,),
          SizedBox(height: 3),
        ],
      ),
    );
  }
}