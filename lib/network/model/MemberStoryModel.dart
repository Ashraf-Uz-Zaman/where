class MemberStoryModel {
  Data? _data;
  int? _code;
  String? _message;
  bool? _isSuccess;

  Data? get data => _data;
  int? get code => _code;
  String? get message => _message;
  bool? get isSuccess => _isSuccess;

  MemberStoryModel({
      Data? data,
      int? code,
      String? message,
      bool? isSuccess}){
    _data = data;
    _code = code;
    _message = message;
    _isSuccess = isSuccess;
}

  MemberStoryModel.fromJson(dynamic json) {
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
  List<Stories>? _stories;

  List<Stories>? get stories => _stories;

  Data({
      List<Stories>? stories}){
    _stories = stories;
}

  Data.fromJson(dynamic json) {
    if (json["stories"] != null) {
      _stories = [];
      json["stories"].forEach((v) {
        _stories?.add(Stories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_stories != null) {
      map["stories"] = _stories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Stories {
  int? _memberId;
  String? _memberName;
  String? _profilePicture;
  String? _levelColor;
  List<dynamic>? _storyResponces;

  int? get memberId => _memberId;
  String? get memberName => _memberName;
  String? get profilePicture => _profilePicture;
  String? get levelColor => _levelColor;
  List<dynamic>? get storyResponces => _storyResponces;

  Stories({
      int? memberId,
      String? memberName,
      String? profilePicture,
      String? levelColor,
      List<dynamic>? storyResponces}){
    _memberId = memberId;
    _memberName = memberName;
    _profilePicture = profilePicture;
    _levelColor = levelColor;
    _storyResponces = storyResponces;
}

  Stories.fromJson(dynamic json) {
    _memberId = json["memberId"];
    _memberName = json["memberName"];
    _profilePicture = json["profilePicture"];
    _levelColor = json["levelColor"];
    // if (json["storyResponces"] != null) {
    //   _storyResponces = [];
    //   json["storyResponces"].forEach((v) {
    //     _storyResponces?.add(dynamic.fromJson(v));
    //   });
    // }
    _storyResponces = json["storyResponces"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["memberId"] = _memberId;
    map["memberName"] = _memberName;
    map["profilePicture"] = _profilePicture;
    map["levelColor"] = _levelColor;
    if (_storyResponces != null) {
      map["storyResponces"] = _storyResponces?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

// class StoryResponces{
//
// }