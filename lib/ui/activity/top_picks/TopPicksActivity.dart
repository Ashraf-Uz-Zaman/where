import 'package:flutter/material.dart';
import 'package:where/network/model/TopPicksAllModel.dart';
import 'package:where/ui/activity/top_picks/TopPicksViewModel.dart';
import 'package:where/ui/activity/top_picks/item_top_picks/ItemTopPicks.dart';
import 'package:where/ui/widget/ColoredSafeArea.dart';
import 'package:where/utils/NetworkUtil.dart';
import 'package:where/utils/StringValueUtils.dart';
import 'item_top_picks/ItemTopPicksLoader.dart';

class TopPicksActivity extends StatefulWidget {
  @override
  _TopPicksState createState() => _TopPicksState();
}

class _TopPicksState extends State<TopPicksActivity> {
  final viewModel = TopPicksViewModel();
  final networkStatus = NetworkUtil();
  bool isInternetAvailable = false;

  @override
  void initState() {
    networkStatus.getConncetionStatue().then((value) {
      print(value);
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
          title: Text(StringValueUtils.TOP_PICKS,style: TextStyle(fontSize: 20,color: Colors.white),),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: Colors.black,
        body: isInternetAvailable ? FutureBuilder<TopPicksAllModel>(
          future: viewModel.getTopPicks(),
          builder: (BuildContext context,
              AsyncSnapshot<TopPicksAllModel> snapshot) {
            if (snapshot.hasData) {
              TopPicksAllModel? model = snapshot.data!;
              return model.data != null
                  ? buildList(model)
                  : ItemTopPicksLoader(status: false);
            } else {
              return ItemTopPicksLoader(status: true);
            }
          },
        ) : ItemTopPicksLoader(status: false),

      ),
    );
  }

  Widget buildList(TopPicksAllModel model) {
    return Container(
      margin: EdgeInsets.only(
          top: 10, left: 8, right: 8, bottom: 10),
      child: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 3,
        padding: const EdgeInsets.all(8),
        crossAxisSpacing: 5,
        shrinkWrap: true,
        mainAxisSpacing: 5,
        childAspectRatio: 1,
        children: List.generate(
            model.data!.venues!.length, (index) {
          return ItemTopPicks(
            img: model.data!.venues![index].mainImage!,
            name: model.data!.venues![index].venueName!,
          );
        }),
      ),
    );
  }

}