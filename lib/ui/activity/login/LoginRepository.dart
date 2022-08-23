import 'package:where/network/ApiUtils.dart';
import 'package:where/network/model/login_model.dart';
import 'package:where/network/services/ApiBaseHelper.dart';

class LoginRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<LoginModel> postLogin(loginID, password) async {
    Map<String, String> map = Map<String, String>();
    map["loginId"] = loginID.toString();
    map["password"] = password.toString();
    map["token"] = "e58d7020ebd4";
    final response = await _helper.post(
      ApiUtils.LOGIN_URL,map
    );
    return LoginModel.fromJson(response);
  }
}
