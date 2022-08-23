import 'dart:async';
import 'package:where/network/model/login_model.dart';
import 'package:where/network/services/ApiResponse.dart';
import 'package:where/ui/activity/login/LoginRepository.dart';
import 'package:where/utils/ErrorUtils.dart';

class LoginViewModel{

  String fieldValidation( String value){
    if(value.isEmpty){
      return ErrorUtils.FIELD_EMPTY;
    }
    else{
      return ErrorUtils.FIELD_OK;
    }
  }

  LoginRepository? _repository;

  late StreamController<ApiResponse<LoginModel>>
  _controller;

  StreamSink<ApiResponse<LoginModel>>? get loginSink =>
      _controller.sink;

  Stream<ApiResponse<LoginModel>>? get loginStream =>
      _controller.stream;

  LoginViewModel() {
    _controller = StreamController<ApiResponse<LoginModel>>();
    _repository = LoginRepository();
  }

  fetchBookingTableList(loginId, password) async {
    loginSink!.add(ApiResponse.loading('Sign In'));
    try {
      LoginModel model =
      await _repository!.postLogin(loginId,password);
      loginSink!.add(ApiResponse.completed(model));
    } catch (e) {
      loginSink!.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _controller.close();
  }

}