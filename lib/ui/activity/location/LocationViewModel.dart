import 'dart:convert';
import 'package:http/http.dart';
import 'package:where/network/ApiUtils.dart';
import 'package:where/network/model/NearByVanueModel.dart';

class LocationViewModel{
  Future<NearByVanueModel> getNearByList(double lat, double lan) async {
    Response res =
    await get(Uri.parse(ApiUtils.NEAR_BY_VENUE_URL+"Latitude="+lat.toString()+"&Longitude="+lan.toString() ) );

    if (res.statusCode == 200) {
      final data = json.decode(res.body);
      NearByVanueModel model = NearByVanueModel.fromJson(data);
      return model;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}