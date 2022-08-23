import 'dart:async';
import 'package:where/network/model/ForgetPasswordModel.dart';
import 'package:where/network/model/OtpModel.dart';
import 'package:where/network/model/UpdatePasswordModel.dart';
import 'package:where/network/services/ApiResponse.dart';
import 'package:where/ui/activity/forgot_password/ForgetPasswordRepository.dart';
import 'package:where/utils/ErrorUtils.dart';

class ForgetPasswordViewModel {
  ForgetPasswordRepository? _repository;

  //controller
  late StreamController<ApiResponse<ForgetPasswordModel>>
      _forgetPasswordController;
  late StreamController<ApiResponse<OtpModel>> _otpController;
  late StreamController<ApiResponse<UpdatePasswordModel>> _updateController;

  //Sink
  StreamSink<ApiResponse<ForgetPasswordModel>>? get forgetPasswordSink =>
      _forgetPasswordController.sink;

  StreamSink<ApiResponse<OtpModel>>? get otpSink => _otpController.sink;

  StreamSink<ApiResponse<UpdatePasswordModel>>? get updateSink =>
      _updateController.sink;

  //Stream
  Stream<ApiResponse<ForgetPasswordModel>>? get forgetPasswordStream =>
      _forgetPasswordController.stream;

  Stream<ApiResponse<OtpModel>>? get otpStream => _otpController.stream;

  Stream<ApiResponse<UpdatePasswordModel>>? get updateStream =>
      _updateController.stream;

  ForgetPasswordViewModel() {
    _repository = ForgetPasswordRepository();
    _forgetPasswordController =
        StreamController<ApiResponse<ForgetPasswordModel>>();
    _otpController = StreamController<ApiResponse<OtpModel>>();
    _updateController = StreamController<ApiResponse<UpdatePasswordModel>>();
  }

  fetchForgetPassword(String EmailOrPhone) async {
    forgetPasswordSink!.add(ApiResponse.loading('Checking'));
    try {
      ForgetPasswordModel model =
          await _repository!.getForgetPassword(EmailOrPhone);
      forgetPasswordSink!.add(ApiResponse.completed(model));
    } catch (e) {
      forgetPasswordSink!.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  fetchOTP(String EmailOrPhone, String Otp) async {
    otpSink!.add(ApiResponse.loading('Processing'));
    try {
      OtpModel model =
          await _repository!.getOTP(EmailOrPhone, Otp);
      otpSink!.add(ApiResponse.completed(model));
    } catch (e) {
      otpSink!.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  fetchUpdate(String memberid, String Password) async {
    updateSink!.add(ApiResponse.loading('Updating'));
    try {
      UpdatePasswordModel model =
          await _repository!.postUpdate(memberid, Password);
      updateSink!.add(ApiResponse.completed(model));
    } catch (e) {
      updateSink!.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _forgetPasswordController.close();
    _otpController.close();
    _updateController.close();
  }


  String passwordValidation(String password, String re_passowrd) {
    if (password.isEmpty) {
      return ErrorUtils.PASSWORD_EMPTY;
    }
    if (re_passowrd.isEmpty) {
      return ErrorUtils.RE_PASSWORD_EMPTY;
    } else if (password.length <= 6) {
      return ErrorUtils.PASSWORD_LENGTH;
    } else if (!validateStructure(password)) {
      return ErrorUtils.PASSWORD_STRUCTURE;
    } else if (password != re_passowrd) {
      return ErrorUtils.PASSWORD_NOT_MATCH;
    } else if (password == re_passowrd) {
      return ErrorUtils.PASSWORD_OK;
    } else {
      return ErrorUtils.ERROR_OCCURED;
    }
  }

  bool validateStructure(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
