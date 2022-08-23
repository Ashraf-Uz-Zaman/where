class AllCityModel {
  Data? _data;
  int? _code;
  String? _message;
  bool? _isSuccess;

  Data? get data => _data;
  int? get code => _code;
  String? get message => _message;
  bool? get isSuccess => _isSuccess;

  AllCityModel({
      Data? data, 
      int? code, 
      String? message, 
      bool? isSuccess}){
    _data = data;
    _code = code;
    _message = message;
    _isSuccess = isSuccess;
}

  AllCityModel.fromJson(dynamic json) {
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
  List<Cities>? _cities;

  List<Cities>? get cities => _cities;

  Data({
      List<Cities>? cities}){
    _cities = cities;
}

  Data.fromJson(dynamic json) {
    if (json["cities"] != null) {
      _cities = [];
      json["cities"].forEach((v) {
        _cities?.add(Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_cities != null) {
      map["cities"] = _cities?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Cities {
  int? _cityId;
  String? _name;
  String? _countryName;

  int? get cityId => _cityId;
  String? get name => _name;
  String? get countryName => _countryName;

  Cities({
      int? cityId, 
      String? name, 
      String? countryName}){
    _cityId = cityId;
    _name = name;
    _countryName = countryName;
}

  Cities.fromJson(dynamic json) {
    _cityId = json["cityId"];
    _name = json["name"];
    _countryName = json["countryName"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["cityId"] = _cityId;
    map["name"] = _name;
    map["countryName"] = _countryName;
    return map;
  }

}