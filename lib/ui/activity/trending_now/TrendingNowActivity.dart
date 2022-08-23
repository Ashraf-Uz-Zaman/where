import 'package:flutter/material.dart';
import 'package:where/network/model/TrendingAllModel.dart';
import 'package:where/ui/activity/trending_now/TrendingNowViewModel.dart';
import 'package:where/ui/activity/trending_now/item_trending_now/ItemTrendingNowLoader.dart';
import 'package:where/ui/widget/ColoredSafeArea.dart';
import 'package:where/utils/NetworkUtil.dart';
import 'package:where/utils/StringValueUtils.dart';

import 'item_trending_now/ItemTrendingNow.dart';

class TrendingNowActivity extends StatefulWidget {
  @override
  _TrendingNowState createState() => _TrendingNowState();
}

class _TrendingNowState extends State<TrendingNowActivity> {
  final viewModel = TrendingNowViewModel();
  final networkStatus = NetworkUtil();
  bool isInternetAvailable = false;


  @override
  void initState() {
    networkStatus.getConncetionStatue().then((value) {
      setState(() {
        isInternetAvailable = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(StringValueUtils.TRENDING_NOW,style: TextStyle(fontSize: 20,color: Colors.white),),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: Colors.black,
        body: isInternetAvailable ? FutureBuilder<TrendingAllModel>(
          future: viewModel.getTrendinNowAll(),
          builder: (BuildContext context,
              AsyncSnapshot<TrendingAllModel> snapshot) {
            if (snapshot.hasData) {
              TrendingAllModel? model = snapshot.data!;
              return model.data != null
                  ? buildList(model)
                  : ItemTrendingNowLoader(status: false);
            } else {
              return ItemTrendingNowLoader(status: true);
            }
          },
        ) : ItemTrendingNowLoader(status: false),

      ),
    );
  }


  Widget buildList(TrendingAllModel model) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 10),
      child:
      GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 3,
        padding: const EdgeInsets.all(8),
        crossAxisSpacing: 5,
        shrinkWrap: true,
        mainAxisSpacing: 5,
        childAspectRatio: 1.15,
        children: List.generate(model.data!.venues!.length, (index) {
          return ItemTrendingNow(
            img: model.data!.venues![index].mainImage!,
          );
        }),
      ),

    );
  }
  
}
