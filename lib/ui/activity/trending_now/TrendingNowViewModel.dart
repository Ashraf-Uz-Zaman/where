import 'dart:convert';
import 'package:http/http.dart';
import 'package:where/network/ApiUtils.dart';
import 'package:where/network/model/TrendingAllModel.dart';

class TrendingNowViewModel{
  Future<TrendingAllModel> getTrendinNowAll() async {
    Response res =
    await get(Uri.parse(ApiUtils.TRENDING_URL ));

    if (res.statusCode == 200) {
      final data = json.decode(res.body);
      TrendingAllModel model = TrendingAllModel.fromJson(data);
      return model;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}