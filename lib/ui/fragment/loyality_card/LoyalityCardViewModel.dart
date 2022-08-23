import 'dart:async';

import 'package:where/network/model/member_profile_info_model.dart';
import 'package:where/network/services/ApiResponse.dart';

import 'LoyalityCardRepository.dart';

class LoyalityCardViewModel {

  LoyalityCardRepository? _repository;
  //controller
  late StreamController<ApiResponse<MemberProfileInfoModel>> _memberInfoController;
  //Sink
  StreamSink<ApiResponse<MemberProfileInfoModel>>? get memberInfoSink => _memberInfoController.sink;

  //Stream
  Stream<ApiResponse<MemberProfileInfoModel>>? get memberInfoStream => _memberInfoController.stream;

  //Constractor
  LoyalityCardViewModel() {
    _repository = LoyalityCardRepository();
    _memberInfoController = StreamController<ApiResponse<MemberProfileInfoModel>>();
  }

  fetchMemberInfo(String id) async {
    memberInfoSink!.add(ApiResponse.loading('Checking'));
    try {
      MemberProfileInfoModel model =
      await _repository!.getMemberInfo(id);
      memberInfoSink!.add(ApiResponse.completed(model));
    } catch (e) {
      memberInfoSink!.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }
}