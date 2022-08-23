class MemberProfileInfoModel {
  Data? _data;
  int? _code;
  String? _message;
  bool? _isSuccess;

  Data? get data => _data;
  int? get code => _code;
  String? get message => _message;
  bool? get isSuccess => _isSuccess;

  MemberProfileInfoModel({
      Data? data,
      int? code,
      String? message,
      bool? isSuccess}){
    _data = data;
    _code = code;
    _message = message;
    _isSuccess = isSuccess;
}

  MemberProfileInfoModel.fromJson(dynamic json) {
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
  Member? _member;

  Member? get member => _member;

  Data({
      Member? member}){
    _member = member;
}

  Data.fromJson(dynamic json) {
    _member = json["member"] != null ? Member.fromJson(json["member"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_member != null) {
      map["member"] = _member?.toJson();
    }
    return map;
  }

}

class Member {
  int? _memberId;
  String? _firstName;
  String? _lastName;
  String? _type;
  String? _userName;
  String? _phoneNumber;
  String? _email;
  double? _dateOfBirth;
  String? _gender;
  String? _profilePicture;
  String? _aboutMe;
  dynamic? _postCode;
  String? _address;
  String? _location;
  String? _latitude;
  String? _longitude;
  String? _status;
  int? _referenceMemberId;
  City? _city;
  MemberLevel? _memberLevel;
  int? _pointCount;
  int? _followerCount;
  int? _followingCount;
  List<dynamic>? _myVenue;

  int? get memberId => _memberId;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get type => _type;
  String? get userName => _userName;
  String? get phoneNumber => _phoneNumber;
  String? get email => _email;
  double? get dateOfBirth => _dateOfBirth;
  String? get gender => _gender;
  String? get profilePicture => _profilePicture;
  String? get aboutMe => _aboutMe;
  dynamic? get postCode => _postCode;
  String? get address => _address;
  String? get location => _location;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get status => _status;
  int? get referenceMemberId => _referenceMemberId;
  City? get city => _city;
  MemberLevel? get memberLevel => _memberLevel;
  int? get pointCount => _pointCount;
  int? get followerCount => _followerCount;
  int? get followingCount => _followingCount;
  List<dynamic>? get myVenue => _myVenue;

  Member({
      int? memberId,
      String? firstName,
      String? lastName,
      String? type,
      String? userName,
      String? phoneNumber,
      String? email,
      double? dateOfBirth,
      String? gender,
      String? profilePicture,
      String? aboutMe,
      dynamic? postCode,
      String? address,
      String? location,
      String? latitude,
      String? longitude,
      String? status,
      int? referenceMemberId,
      City? city,
      MemberLevel? memberLevel,
      int? pointCount,
      int? followerCount,
      int? followingCount,
      List<dynamic>? myVenue}){
    _memberId = memberId;
    _firstName = firstName;
    _lastName = lastName;
    _type = type;
    _userName = userName;
    _phoneNumber = phoneNumber;
    _email = email;
    _dateOfBirth = dateOfBirth;
    _gender = gender;
    _profilePicture = profilePicture;
    _aboutMe = aboutMe;
    _postCode = postCode;
    _address = address;
    _location = location;
    _latitude = latitude;
    _longitude = longitude;
    _status = status;
    _referenceMemberId = referenceMemberId;
    _city = city;
    _memberLevel = memberLevel;
    _pointCount = pointCount;
    _followerCount = followerCount;
    _followingCount = followingCount;
    _myVenue = myVenue;
}

  Member.fromJson(dynamic json) {
    _memberId = json["memberId"];
    _firstName = json["firstName"];
    _lastName = json["lastName"];
    _type = json["type"];
    _userName = json["userName"];
    _phoneNumber = json["phoneNumber"];
    _email = json["email"];
    _dateOfBirth = json["dateOfBirth"];
    _gender = json["gender"];
    _profilePicture = json["profilePicture"];
    _aboutMe = json["aboutMe"];
    _postCode = json["postCode"];
    _address = json["address"];
    _location = json["location"];
    _latitude = json["latitude"];
    _longitude = json["longitude"];
    _status = json["status"];
    _referenceMemberId = json["referenceMemberId"];
    _city = json["city"] != null ? City.fromJson(json["city"]) : null;
    _memberLevel = json["memberLevel"] != null ? MemberLevel.fromJson(json["memberLevel"]) : null;
    _pointCount = json["pointCount"];
    _followerCount = json["followerCount"];
    _followingCount = json["followingCount"];
    _myVenue = json["myVenue"];
    // if (json["myVenue"] != null) {
    //   _myVenue = [];
    //   json["myVenue"].forEach((v) {
    //     _myVenue?.add(dynamic.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["memberId"] = _memberId;
    map["firstName"] = _firstName;
    map["lastName"] = _lastName;
    map["type"] = _type;
    map["userName"] = _userName;
    map["phoneNumber"] = _phoneNumber;
    map["email"] = _email;
    map["dateOfBirth"] = _dateOfBirth;
    map["gender"] = _gender;
    map["profilePicture"] = _profilePicture;
    map["aboutMe"] = _aboutMe;
    map["postCode"] = _postCode;
    map["address"] = _address;
    map["location"] = _location;
    map["latitude"] = _latitude;
    map["longitude"] = _longitude;
    map["status"] = _status;
    map["referenceMemberId"] = _referenceMemberId;
    if (_city != null) {
      map["city"] = _city?.toJson();
    }
    if (_memberLevel != null) {
      map["memberLevel"] = _memberLevel?.toJson();
    }
    map["pointCount"] = _pointCount;
    map["followerCount"] = _followerCount;
    map["followingCount"] = _followingCount;
    if (_myVenue != null) {
      map["myVenue"] = _myVenue?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class MemberLevel {
  int? _memberLevelId;
  String? _levelName;
  String? _color;
  int? _point;
  String? _image;

  int? get memberLevelId => _memberLevelId;
  String? get levelName => _levelName;
  String? get color => _color;
  int? get point => _point;
  String? get image => _image;

  MemberLevel({
      int? memberLevelId,
      String? levelName,
      String? color,
      int? point,
      String? image}){
    _memberLevelId = memberLevelId;
    _levelName = levelName;
    _color = color;
    _point = point;
    _image = image;
}

  MemberLevel.fromJson(dynamic json) {
    _memberLevelId = json["memberLevelId"];
    _levelName = json["levelName"];
    _color = json["color"];
    _point = json["point"];
    _image = json["image"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["memberLevelId"] = _memberLevelId;
    map["levelName"] = _levelName;
    map["color"] = _color;
    map["point"] = _point;
    map["image"] = _image;
    return map;
  }

}

class City {
  int? _cityId;
  String? _name;
  String? _countryName;

  int? get cityId => _cityId;
  String? get name => _name;
  String? get countryName => _countryName;

  City({
      int? cityId,
      String? name,
      String? countryName}){
    _cityId = cityId;
    _name = name;
    _countryName = countryName;
}

  City.fromJson(dynamic json) {
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