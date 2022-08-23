import 'package:where/network/ApiUtils.dart';
import 'package:where/network/model/ForgetPasswordModel.dart';
import 'package:where/network/model/OtpModel.dart';
import 'package:where/network/model/UpdatePasswordModel.dart';
import 'package:where/network/services/ApiBaseHelper.dart';

class ForgetPasswordRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<ForgetPasswordModel> getForgetPassword(String EmailOrPhone) async {
    final response =
        await _helper.get(ApiUtils.FORGET_PASSWORD_URL + EmailOrPhone);
    return ForgetPasswordModel.fromJson(response);
  }

  Future<OtpModel> getOTP(String EmailOrPhone, String Otp) async {
    final response = await _helper
        .get(ApiUtils.OTP_URL + 'EmailOrPhone=' + EmailOrPhone + '&OTP=' + Otp);
    return OtpModel.fromJson(response);
  }

  Future<UpdatePasswordModel> postUpdate(
      String memberid, String Password) async {
    String tails = "?MemberId=" + memberid.toString() + '&Password=' + Password;
    final response =
        await _helper.post_params(ApiUtils.UPDATE_PASSWORD_URL, tails);
    return UpdatePasswordModel.fromJson(response);
  }


}
