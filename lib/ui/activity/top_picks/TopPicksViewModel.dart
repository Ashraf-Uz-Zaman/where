import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart';
import 'package:where/network/ApiUtils.dart';
import 'package:where/network/model/TopPicksAllModel.dart';


class TopPicksViewModel {


  Future<TopPicksAllModel> getTopPicks() async {
    Response res = await get(Uri.parse(ApiUtils.TOP_PICKS_URL));

    if (res.statusCode == 200) {
      final data = json.decode(res.body);

      TopPicksAllModel topPick = TopPicksAllModel.fromJson(data);
      return topPick;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
