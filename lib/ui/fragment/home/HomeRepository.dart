import 'package:where/network/ApiUtils.dart';
import 'package:where/network/model/CategoriesModel.dart';
import 'package:where/network/model/MemberStoryModel.dart';
import 'package:where/network/model/RecentlyAddedHomeModel.dart';
import 'package:where/network/model/TendingHomeModel.dart';
import 'package:where/network/model/TopPicksHomeModel.dart';
import 'package:where/network/services/ApiBaseHelper.dart';

class HomeRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<MemberStoryModel> getMemberStories( memberId) async {

    final response = await _helper.get(ApiUtils.MEMBER_STORY_URL+memberId);
    return MemberStoryModel.fromJson(response);
  }

  Future<CategoriesModel> getCategories() async {

    final response = await _helper.get(ApiUtils.CATEGORIES_URL);
    return CategoriesModel.fromJson(response);
  }


  Future<TopPicksHomeModel> getTopPicks( id) async {
    final response = await _helper.get(ApiUtils.TOP_PICKS_VENUE_URL + id.toString());
    return TopPicksHomeModel.fromJson(response);
  }


  Future<TendingHomeModel> getTending( id) async {
    final response = await _helper.get(ApiUtils.TRENDING_VENUE_URL + id.toString());
    return TendingHomeModel.fromJson(response);
  }

  Future<RecentlyAddedHomeModel> getRecent( id) async {
    final response = await _helper.get(ApiUtils.RECENTLY_ADDED_VENUE_URL + id.toString());
    return RecentlyAddedHomeModel.fromJson(response);
  }


}
