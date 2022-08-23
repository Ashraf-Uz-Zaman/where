import 'package:where/network/ApiUtils.dart';
import 'package:where/network/model/member_profile_info_model.dart';
import 'dart:convert';
import 'package:http/http.dart';

class ProfileViewModel{
  Future<MemberProfileInfoModel> getMemberStories(String memberId) async {
    Response res = await get(Uri.parse(ApiUtils.MEMBER_INFO_URL+memberId));
    if (res.statusCode == 200) {
      final data = json.decode(res.body);
      MemberProfileInfoModel model = MemberProfileInfoModel.fromJson(data);
      return model;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}