class MemberProfileImageModel {
  Data? _data;
  int? _code;
  String? _message;
  bool? _isSuccess;

  Data? get data => _data;
  int? get code => _code;
  String? get message => _message;
  bool? get isSuccess => _isSuccess;

  MemberProfileImageModel({
      Data? data, 
      int? code, 
      String? message, 
      bool? isSuccess}){
    _data = data;
    _code = code;
    _message = message;
    _isSuccess = isSuccess;
}

  MemberProfileImageModel.fromJson(dynamic json) {
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
  String? _filename;

  String? get filename => _filename;

  Data({
      String? filename}){
    _filename = filename;
}

  Data.fromJson(dynamic json) {
    _filename = json["filename"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["filename"] = _filename;
    return map;
  }

}