class LoginModel {
  Data? _data;
  int? _code;
  String? _message;
  bool? _isSuccess;

  Data? get data => _data;
  int? get code => _code;
  String? get message => _message;
  bool? get isSuccess => _isSuccess;

  LoginModel({
      Data? data, 
      int? code, 
      String? message, 
      bool? isSuccess}){
    _data = data;
    _code = code;
    _message = message;
    _isSuccess = isSuccess;
}

  LoginModel.fromJson(dynamic json) {
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
  String? _memberFirstName;
  String? _memberLastName;
  String? _memberType;
  int? _venueId;
  String? _venueName;
  String? _address;
  String? _token;

  int? get memberId => _memberId;
  String? get memberFirstName => _memberFirstName;
  String? get memberLastName => _memberLastName;
  String? get memberType => _memberType;
  int? get venueId => _venueId;
  String? get venueName => _venueName;
  String? get address => _address;
  String? get token => _token;

  Data({
      int? memberId, 
      String? memberFirstName, 
      String? memberLastName, 
      String? memberType, 
      int? venueId, 
      String? venueName, 
      String? address, 
      String? token}){
    _memberId = memberId;
    _memberFirstName = memberFirstName;
    _memberLastName = memberLastName;
    _memberType = memberType;
    _venueId = venueId;
    _venueName = venueName;
    _address = address;
    _token = token;
}

  Data.fromJson(dynamic json) {
    _memberId = json["memberId"];
    _memberFirstName = json["memberFirstName"];
    _memberLastName = json["memberLastName"];
    _memberType = json["memberType"];
    _venueId = json["venueId"];
    _venueName = json["venueName"];
    _address = json["address"];
    _token = json["token"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["memberId"] = _memberId;
    map["memberFirstName"] = _memberFirstName;
    map["memberLastName"] = _memberLastName;
    map["memberType"] = _memberType;
    map["venueId"] = _venueId;
    map["venueName"] = _venueName;
    map["address"] = _address;
    map["token"] = _token;
    return map;
  }

}