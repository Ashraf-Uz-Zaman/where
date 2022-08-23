import 'package:flutter/material.dart';
import 'package:where/network/model/NearByVanueModel.dart';
import 'package:where/ui/activity/location/LocationViewModel.dart';
import 'package:where/ui/activity/location/item_location/ItemLocation.dart';
import 'package:where/ui/activity/location/item_location/ItemLocationLoader.dart';
import 'package:where/ui/widget/ColoredSafeArea.dart';
import 'package:where/utils/NetworkUtil.dart';
import 'package:where/utils/StringValueUtils.dart';


class LocationActivity extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<LocationActivity> {
  final viewModel = LocationViewModel();
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
          title: Text(
            StringValueUtils.LOCATIONS,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            searchField(),
            SizedBox(
              height: 5,
            ),
            Flexible(child:  nearByLocationCallField()
           ),
          ],
        ),
      ),
    );
  }

  Widget searchField() {
    return Container(
      margin: EdgeInsets.only(
        top: 6,
        left: 15,
        right: 15,
      ),
      alignment: Alignment.topCenter,
      child: TextFormField(
        keyboardType: TextInputType.text,
        autofocus: false,
        obscureText: false,
        cursorColor: Colors.white,
        style: TextStyle(fontSize: 15, color: Colors.white),
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.only(top: 5, bottom: 5, left: 8, right: 10),
          filled: true,
          fillColor: Colors.grey.shade800,
          hintText: StringValueUtils.SEARCH_LOCATIONS,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          hintStyle: TextStyle(fontSize: 15, color: Colors.white70),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
    );
  }

  Widget nearByLocationCallField() {
    return isInternetAvailable ? FutureBuilder<NearByVanueModel>(
      future: viewModel.getNearByList(25.224820176765036, 55.89843750000001),
      builder: (BuildContext context,
          AsyncSnapshot<NearByVanueModel> snapshot) {
        if (snapshot.hasData) {
          NearByVanueModel ? model = snapshot.data!;
          return model.data != null
              ? buildList(model)
              : ItemLocationLoader(status: false);
        } else {
          return ItemLocationLoader(status: true);
        }
      },
    ) : ItemLocationLoader(status: false);
  }


  Widget buildList(NearByVanueModel model) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: model.data!.venues!.length,
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () {
            setState(() {});
          },
          child: ItemLocation(
            img: model.data!.venues![index].mainImage!,
            name: model.data!.venues![index].venueName!,
            location: model.data!.venues![index].location!,
          ),
        );
      },
    );
  }

}
