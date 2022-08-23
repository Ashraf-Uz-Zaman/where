

class OtpModel {
  Data? _data;
  int? _code;
  String? _message;
  bool? _isSuccess;

  Data? get data => _data;
  int? get code => _code;
  String? get message => _message;
  bool? get isSuccess => _isSuccess;

  OtpModel({
      Data? data, 
      int? code, 
      String? message, 
      bool? isSuccess}){
    _data = data;
    _code = code;
    _message = message;
    _isSuccess = isSuccess;
}

  OtpModel.fromJson(dynamic json) {
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null;
    _code = json["code"];
    _message = json["message"];
    _isSuccess = json["isSuccess"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_data != null) {
      map["data"] = _data?.toJson();
    }
    map["code"] = _code;
    map["message"] = _message;
    map["isSuccess"] = _isSuccess;
    return map;
  }

}


class Data {
  int? _memberId;

  int? get memberId => _memberId;

  Data({
      int? memberId}){
    _memberId = memberId;
}

  Data.fromJson(dynamic json) {
    _memberId = json["memberId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["memberId"] = _memberId;
    return map;
  }

}