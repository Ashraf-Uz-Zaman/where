import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:where/network/model/booking_table_details_model.dart';

import 'ImageSliderLoader.dart';

class ImageSlider extends StatelessWidget {
  final List<VenueImages>? list;
  final onBackPress;
  final int index;
  final int end;
  final left;
  final right;
  final int initCount;
  int count = 0;

  ImageSlider({
    Key? key,
    required this.list,
    required this.onBackPress,
    required this.index,
    required this.end, this.left, this.right,required this.initCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    count  = initCount;
    return Stack(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(3.0),
        child:

        CachedNetworkImage(
          fit: BoxFit.fill,
          height: 175,
          width: double.infinity,
          imageUrl: list![count].imageFile!,
          placeholder: (context, url) => ImageSliderLoader(status: true),
          errorWidget: (context, url, error) => ImageSliderLoader(status: false),
        ),
      ),
      Positioned(
        left: 0,
        top: 10,
        child: InkWell(
          onTap: onBackPress,
          child: Container(
            padding: EdgeInsets.all(5),
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
      Positioned(
        left: 7,
        bottom: 50,
        child: InkWell(
          onTap: () {
            if (count > 0) {
              count--;
              left(count);
            }

          },
          child: Container(
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: count == index ? Colors.black.withOpacity(.4) :Colors.blue.withOpacity(.4),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ),
      Positioned(
        right: 7,
        bottom: 50,
        child: InkWell(
          onTap: () {
            if (count < end - 1) {
              count++;
              right(count);
            }

          },
          child: Container(
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: count == end-1 ? Colors.black.withOpacity(.4) :Colors.blue.withOpacity(.4),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ),
    ]);
  }
}
