import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:where/network/ApiUtils.dart';
import 'package:where/network/model/CategoriesModel.dart';
import 'package:where/network/model/LogoutModel.dart';
import 'package:where/network/model/MemberStoryModel.dart';
import 'package:where/network/model/RecentlyAddedHomeModel.dart';
import 'package:where/network/model/TendingHomeModel.dart';
import 'package:where/network/model/TopPicksHomeModel.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:where/network/services/ApiResponse.dart';
import 'package:where/ui/fragment/home/HomeRepository.dart';

class HomeViewModel{

  HomeRepository? _repository;

  //controller
  late StreamController<ApiResponse<MemberStoryModel>>_memberStoryController;
  late StreamController<ApiResponse<CategoriesModel>> _categoriesController;
  late StreamController<ApiResponse<TopPicksHomeModel>> _topPicksController;
  late StreamController<ApiResponse<TendingHomeModel>> _tendingController;
  late StreamController<ApiResponse<RecentlyAddedHomeModel>> _recentlyAddedController;

  //Sink
  StreamSink<ApiResponse<MemberStoryModel>>? get memberStorySink => _memberStoryController.sink;
  StreamSink<ApiResponse<CategoriesModel>>? get categoriesSink => _categoriesController.sink;
  StreamSink<ApiResponse<TopPicksHomeModel>>? get topPicksSink => _topPicksController.sink;
  StreamSink<ApiResponse<TendingHomeModel>>? get tendingSink => _tendingController.sink;
  StreamSink<ApiResponse<RecentlyAddedHomeModel>>? get recentlyAddedSink => _recentlyAddedController.sink;

  //Stream
  Stream<ApiResponse<MemberStoryModel>>? get memberStoryStream => _memberStoryController.stream;
  Stream<ApiResponse<CategoriesModel>>? get categoriesStream => _categoriesController.stream;
  Stream<ApiResponse<TopPicksHomeModel>>? get topPicksStream => _topPicksController.stream;
  Stream<ApiResponse<TendingHomeModel>>? get tendingStream => _tendingController.stream;
  Stream<ApiResponse<RecentlyAddedHomeModel>>? get recentlyAddedStream => _recentlyAddedController.stream;

  //Constractor
  HomeViewModel() {
    _repository = HomeRepository();
    _memberStoryController = StreamController<ApiResponse<MemberStoryModel>>();
    _categoriesController = StreamController<ApiResponse<CategoriesModel>>();
    _topPicksController = StreamController<ApiResponse<TopPicksHomeModel>>();
    _tendingController = StreamController<ApiResponse<TendingHomeModel>>();
    _recentlyAddedController = StreamController<ApiResponse<RecentlyAddedHomeModel>>();
  }

  fetchMemberStories(String id) async {
    memberStorySink!.add(ApiResponse.loading('Checking'));
    try {
      MemberStoryModel model =
      await _repository!.getMemberStories(id);
      memberStorySink!.add(ApiResponse.completed(model));
    } catch (e) {
      memberStorySink!.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  fetchCategories() async {
    categoriesSink!.add(ApiResponse.loading('Processing'));
    try {
      CategoriesModel model =
      await _repository!.getCategories();
      categoriesSink!.add(ApiResponse.completed(model));
    } catch (e) {
      categoriesSink!.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  fetchTopPicks(String id) async {
    topPicksSink!.add(ApiResponse.loading('Updating'));
    try {
      TopPicksHomeModel model =
      await _repository!.getTopPicks(id);
      topPicksSink!.add(ApiResponse.completed(model));
    } catch (e) {
      topPicksSink!.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  fetchTending(String id) async {
    tendingSink!.add(ApiResponse.loading('Updating'));
    try {
      TendingHomeModel model =
      await _repository!.getTending(id);
      tendingSink!.add(ApiResponse.completed(model));
    } catch (e) {
      tendingSink!.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  fetchRecently(String id) async {
    recentlyAddedSink!.add(ApiResponse.loading('Updating'));
    try {
      RecentlyAddedHomeModel model =
      await _repository!.getRecent(id);
      recentlyAddedSink!.add(ApiResponse.completed(model));
    } catch (e) {
      recentlyAddedSink!.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _memberStoryController.close();
    _categoriesController.close();
    _topPicksController.close();
    _tendingController.close();
    _recentlyAddedController.close();
  }

  // Future<MemberStoryModel> getMemberStories(String memberId) async {
  //   Response res = await get(Uri.parse(ApiUtils.MEMBER_STORY_URL+memberId));
  //   if (res.statusCode == 200) {
  //     final data = json.decode(res.body);
  //     MemberStoryModel model = MemberStoryModel.fromJson(data);
  //     return model;
  //   } else {
  //     throw "Unable to retrieve posts.";
  //   }
  // }

  // Future<CategoriesModel> getCategories() async {
  //   Response res = await get(Uri.parse(ApiUtils.CATEGORIES_URL));
  //   if (res.statusCode == 200) {
  //     final data = json.decode(res.body);
  //     CategoriesModel categories = CategoriesModel.fromJson(data);
  //     return categories;
  //   } else {
  //     throw "Unable to retrieve posts.";
  //   }
  // }

  // Future<TopPicksHomeModel> getTopPicks(int id) async {
  //   Response res =
  //       await get(Uri.parse(ApiUtils.TOP_PICKS_VENUE_URL + id.toString()));
  //
  //   if (res.statusCode == 200) {
  //     final data = json.decode(res.body);
  //     TopPicksHomeModel topPick = TopPicksHomeModel.fromJson(data);
  //     return topPick;
  //
  //   } else {
  //     throw "Unable to retrieve posts.";
  //   }
  // }
  //
  // Future<TendingHomeModel> getTending(int id) async {
  //   Response res =
  //       await get(Uri.parse(ApiUtils.TRENDING_VENUE_URL + id.toString()));
  //
  //   if (res.statusCode == 200) {
  //     final data = json.decode(res.body);
  //     TendingHomeModel tendingHomeModel = TendingHomeModel.fromJson(data);
  //     return tendingHomeModel;
  //   } else {
  //     throw "Unable to retrieve posts.";
  //   }
  // }
  //
  // Future<RecentlyAddedHomeModel> getRecentlyAdded(int id) async {
  //   Response res =
  //       await get(Uri.parse(ApiUtils.RECENTLY_ADDED_VENUE_URL + id.toString()));
  //
  //   if (res.statusCode == 200) {
  //     final data = json.decode(res.body);
  //
  //     RecentlyAddedHomeModel recentlyAddedHomeModel =
  //         RecentlyAddedHomeModel.fromJson(data);
  //     return recentlyAddedHomeModel;
  //   } else {
  //     throw "Unable to retrieve posts.";
  //   }
  // }


  Future<LogoutModel> postLogout() async {
    var res = await post(Uri.parse(ApiUtils.LOGOUT_URL), body: {
      'token': "e58d7020ebd4",
    }  );
    if (res.statusCode == 200) {
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
      final data = json.decode(res.body);
      LogoutModel model = LogoutModel.fromJson(data);
      return model;
    } else {
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
      throw "Unable to retrieve posts.";
    }
  }


}
