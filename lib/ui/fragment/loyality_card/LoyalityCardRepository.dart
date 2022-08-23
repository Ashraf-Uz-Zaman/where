
import 'package:where/network/ApiUtils.dart';
import 'package:where/network/model/member_profile_info_model.dart';
import 'package:where/network/services/ApiBaseHelper.dart';

class LoyalityCardRepository{
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<MemberProfileInfoModel> getMemberInfo( memberId) async {

    final response = await _helper.get(ApiUtils.MEMBER_INFO_URL+memberId);
    return MemberProfileInfoModel.fromJson(response);
  }


}