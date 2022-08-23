
class RecentlyAddedHomeModel {
  Data? _data;
  int? _code;
  String? _message;
  bool? _isSuccess;

  Data? get data => _data;
  int? get code => _code;
  String? get message => _message;
  bool? get isSuccess => _isSuccess;

  RecentlyAddedHomeModel({
      Data? data, 
      int? code, 
      String? message, 
      bool? isSuccess}){
    _data = data;
    _code = code;
    _message = message;
    _isSuccess = isSuccess;
}

  RecentlyAddedHomeModel.fromJson(dynamic json) {
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
  List<Venues>? _venues;

  List<Venues>? get venues => _venues;

  Data({
      List<Venues>? venues}){
    _venues = venues;
}

  Data.fromJson(dynamic json) {
    if (json["venues"] != null) {
      _venues = [];
      json["venues"].forEach((v) {
        _venues?.add(Venues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_venues != null) {
      map["venues"] = _venues?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Venues {
  int? _venueId;
  String? _venueName;
  String? _venueNameAr;
  String? _subTitle;
  String? _subTitleAr;
  String? _description;
  String? _descriptionAr;
  String? _latitude;
  String? _longitude;
  String? _location;
  String? _conditions;
  String? _conditionsAr;
  String? _mainImage;
  VenueCategory? _venueCategory;
  List<VenueImages>? _venueImages;
  List<VenueTimes>? _venueTimes;
  List<VenueReviews>? _venueReviews;
  List<CategoryWiseMenuItems>? _categoryWiseMenuItems;

  int? get venueId => _venueId;
  String? get venueName => _venueName;
  String? get venueNameAr => _venueNameAr;
  String? get subTitle => _subTitle;
  String? get subTitleAr => _subTitleAr;
  String? get description => _description;
  String? get descriptionAr => _descriptionAr;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get location => _location;
  String? get conditions => _conditions;
  String? get conditionsAr => _conditionsAr;
  String? get mainImage => _mainImage;
  VenueCategory? get venueCategory => _venueCategory;
  List<VenueImages>? get venueImages => _venueImages;
  List<VenueTimes>? get venueTimes => _venueTimes;
  List<VenueReviews>? get venueReviews => _venueReviews;
  List<CategoryWiseMenuItems>? get categoryWiseMenuItems => _categoryWiseMenuItems;

  Venues({
      int? venueId, 
      String? venueName, 
      String? venueNameAr, 
      String? subTitle, 
      String? subTitleAr, 
      String? description, 
      String? descriptionAr, 
      String? latitude, 
      String? longitude, 
      String? location, 
      String? conditions, 
      String? conditionsAr, 
      String? mainImage, 
      VenueCategory? venueCategory, 
      List<VenueImages>? venueImages, 
      List<VenueTimes>? venueTimes,
      List<VenueReviews>? venueReviews,
      List<CategoryWiseMenuItems>? categoryWiseMenuItems}){
    _venueId = venueId;
    _venueName = venueName;
    _venueNameAr = venueNameAr;
    _subTitle = subTitle;
    _subTitleAr = subTitleAr;
    _description = description;
    _descriptionAr = descriptionAr;
    _latitude = latitude;
    _longitude = longitude;
    _location = location;
    _conditions = conditions;
    _conditionsAr = conditionsAr;
    _mainImage = mainImage;
    _venueCategory = venueCategory;
    _venueImages = venueImages;
    _venueTimes = venueTimes;
    _venueReviews = venueReviews;
    _categoryWiseMenuItems = categoryWiseMenuItems;
}

  Venues.fromJson(dynamic json) {
    _venueId = json["venueId"];
    _venueName = json["venueName"];
    _venueNameAr = json["venueNameAr"];
    _subTitle = json["subTitle"];
    _subTitleAr = json["subTitleAr"];
    _description = json["description"];
    _descriptionAr = json["descriptionAr"];
    _latitude = json["latitude"];
    _longitude = json["longitude"];
    _location = json["location"];
    _conditions = json["conditions"];
    _conditionsAr = json["conditionsAr"];
    _mainImage = json["mainImage"];
    _venueCategory = json["venueCategory"] != null ? VenueCategory.fromJson(json["venueCategory"]) : null;
    if (json["venueImages"] != null) {
      _venueImages = [];
      json["venueImages"].forEach((v) {
        _venueImages?.add(VenueImages.fromJson(v));
      });
    }
    if (json["venueTimes"] != null) {
      _venueTimes = [];
      json["venueTimes"].forEach((v) {
        _venueTimes?.add(VenueTimes.fromJson(v));
      });
    }
    if (json["venueReviews"] != null) {
      _venueReviews = [];
      json["venueReviews"].forEach((v) {
        _venueReviews?.add(VenueReviews.fromJson(v));
      });
    }
    if (json["categoryWiseMenuItems"] != null) {
      _categoryWiseMenuItems = [];
      json["categoryWiseMenuItems"].forEach((v) {
        _categoryWiseMenuItems?.add(CategoryWiseMenuItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["venueId"] = _venueId;
    map["venueName"] = _venueName;
    map["venueNameAr"] = _venueNameAr;
    map["subTitle"] = _subTitle;
    map["subTitleAr"] = _subTitleAr;
    map["description"] = _description;
    map["descriptionAr"] = _descriptionAr;
    map["latitude"] = _latitude;
    map["longitude"] = _longitude;
    map["location"] = _location;
    map["conditions"] = _conditions;
    map["conditionsAr"] = _conditionsAr;
    map["mainImage"] = _mainImage;
    if (_venueCategory != null) {
      map["venueCategory"] = _venueCategory?.toJson();
    }
    if (_venueImages != null) {
      map["venueImages"] = _venueImages?.map((v) => v.toJson()).toList();
    }
    if (_venueTimes != null) {
      map["venueTimes"] = _venueTimes?.map((v) => v.toJson()).toList();
    }
    if (_venueReviews != null) {
      map["venueReviews"] = _venueReviews?.map((v) => v.toJson()).toList();
    }
    if (_categoryWiseMenuItems != null) {
      map["categoryWiseMenuItems"] = _categoryWiseMenuItems?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CategoryWiseMenuItems {
  int? _menuItemCategoryId;
  String? _itemCategoryName;
  String? _itemCategoryNameAr;
  List<MenuItem>? _menuItem;

  int? get menuItemCategoryId => _menuItemCategoryId;
  String? get itemCategoryName => _itemCategoryName;
  String? get itemCategoryNameAr => _itemCategoryNameAr;
  List<MenuItem>? get menuItem => _menuItem;

  CategoryWiseMenuItems({
      int? menuItemCategoryId, 
      String? itemCategoryName, 
      String? itemCategoryNameAr, 
      List<MenuItem>? menuItem}){
    _menuItemCategoryId = menuItemCategoryId;
    _itemCategoryName = itemCategoryName;
    _itemCategoryNameAr = itemCategoryNameAr;
    _menuItem = menuItem;
}

  CategoryWiseMenuItems.fromJson(dynamic json) {
    _menuItemCategoryId = json["menuItemCategoryId"];
    _itemCategoryName = json["itemCategoryName"];
    _itemCategoryNameAr = json["itemCategoryNameAr"];
    if (json["menuItem"] != null) {
      _menuItem = [];
      json["menuItem"].forEach((v) {
        _menuItem?.add(MenuItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["menuItemCategoryId"] = _menuItemCategoryId;
    map["itemCategoryName"] = _itemCategoryName;
    map["itemCategoryNameAr"] = _itemCategoryNameAr;
    if (_menuItem != null) {
      map["menuItem"] = _menuItem?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// menuItemId : 1045
/// itemName : "Fried Fish"
/// itemNameAr : "Fried Fish"
/// itemDescription : "This is not real fried fish"
/// itemDescriptionAr : "This is not real fried fish"
/// itemPrice : 15.0
/// itemPriceAr : 15.0
/// itemLimit : 1
/// itemImage : "http://where.r-y-x.com/Content/admin-assets/uploads/MenuItemImage/060160_image_scaled_image_picker45042471.jpg"
/// menuItemCategory : null
/// venues : null

class MenuItem {
  int? _menuItemId;
  String? _itemName;
  String? _itemNameAr;
  String? _itemDescription;
  String? _itemDescriptionAr;
  double? _itemPrice;
  double? _itemPriceAr;
  int? _itemLimit;
  String? _itemImage;
  dynamic? _menuItemCategory;
  dynamic? _venues;

  int? get menuItemId => _menuItemId;
  String? get itemName => _itemName;
  String? get itemNameAr => _itemNameAr;
  String? get itemDescription => _itemDescription;
  String? get itemDescriptionAr => _itemDescriptionAr;
  double? get itemPrice => _itemPrice;
  double? get itemPriceAr => _itemPriceAr;
  int? get itemLimit => _itemLimit;
  String? get itemImage => _itemImage;
  dynamic? get menuItemCategory => _menuItemCategory;
  dynamic? get venues => _venues;

  MenuItem({
      int? menuItemId, 
      String? itemName, 
      String? itemNameAr, 
      String? itemDescription, 
      String? itemDescriptionAr, 
      double? itemPrice, 
      double? itemPriceAr, 
      int? itemLimit, 
      String? itemImage, 
      dynamic? menuItemCategory, 
      dynamic? venues}){
    _menuItemId = menuItemId;
    _itemName = itemName;
    _itemNameAr = itemNameAr;
    _itemDescription = itemDescription;
    _itemDescriptionAr = itemDescriptionAr;
    _itemPrice = itemPrice;
    _itemPriceAr = itemPriceAr;
    _itemLimit = itemLimit;
    _itemImage = itemImage;
    _menuItemCategory = menuItemCategory;
    _venues = venues;
}

  MenuItem.fromJson(dynamic json) {
    _menuItemId = json["menuItemId"];
    _itemName = json["itemName"];
    _itemNameAr = json["itemNameAr"];
    _itemDescription = json["itemDescription"];
    _itemDescriptionAr = json["itemDescriptionAr"];
    _itemPrice = json["itemPrice"];
    _itemPriceAr = json["itemPriceAr"];
    _itemLimit = json["itemLimit"];
    _itemImage = json["itemImage"];
    _menuItemCategory = json["menuItemCategory"];
    _venues = json["venues"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["menuItemId"] = _menuItemId;
    map["itemName"] = _itemName;
    map["itemNameAr"] = _itemNameAr;
    map["itemDescription"] = _itemDescription;
    map["itemDescriptionAr"] = _itemDescriptionAr;
    map["itemPrice"] = _itemPrice;
    map["itemPriceAr"] = _itemPriceAr;
    map["itemLimit"] = _itemLimit;
    map["itemImage"] = _itemImage;
    map["menuItemCategory"] = _menuItemCategory;
    map["venues"] = _venues;
    return map;
  }

}

/// venueImageId : 34
/// venueId : 18
/// imageFile : "http://where.r-y-x.com/Content/admin-assets/uploads/VenueImage/362691_image_scaled_image_picker425440000.jpg"
/// title : ""
/// titleAr : ""

class VenueImages {
  int? _venueImageId;
  int? _venueId;
  String? _imageFile;
  String? _title;
  String? _titleAr;

  int? get venueImageId => _venueImageId;
  int? get venueId => _venueId;
  String? get imageFile => _imageFile;
  String? get title => _title;
  String? get titleAr => _titleAr;

  VenueImages({
      int? venueImageId, 
      int? venueId, 
      String? imageFile, 
      String? title, 
      String? titleAr}){
    _venueImageId = venueImageId;
    _venueId = venueId;
    _imageFile = imageFile;
    _title = title;
    _titleAr = titleAr;
}

  VenueImages.fromJson(dynamic json) {
    _venueImageId = json["venueImageId"];
    _venueId = json["venueId"];
    _imageFile = json["imageFile"];
    _title = json["title"];
    _titleAr = json["titleAr"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["venueImageId"] = _venueImageId;
    map["venueId"] = _venueId;
    map["imageFile"] = _imageFile;
    map["title"] = _title;
    map["titleAr"] = _titleAr;
    return map;
  }

}


class VenueCategory {
  int? _venueCategoryId;
  String? _categoryName;
  String? _categoryNameAr;
  String? _categoryIcon;
  dynamic? _venueCategoryParent;

  int? get venueCategoryId => _venueCategoryId;
  String? get categoryName => _categoryName;
  String? get categoryNameAr => _categoryNameAr;
  String? get categoryIcon => _categoryIcon;
  dynamic? get venueCategoryParent => _venueCategoryParent;

  VenueCategory({
      int? venueCategoryId, 
      String? categoryName, 
      String? categoryNameAr, 
      String? categoryIcon, 
      dynamic? venueCategoryParent}){
    _venueCategoryId = venueCategoryId;
    _categoryName = categoryName;
    _categoryNameAr = categoryNameAr;
    _categoryIcon = categoryIcon;
    _venueCategoryParent = venueCategoryParent;
}

  VenueCategory.fromJson(dynamic json) {
    _venueCategoryId = json["venueCategoryId"];
    _categoryName = json["categoryName"];
    _categoryNameAr = json["categoryNameAr"];
    _categoryIcon = json["categoryIcon"];
    _venueCategoryParent = json["venueCategoryParent"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["venueCategoryId"] = _venueCategoryId;
    map["categoryName"] = _categoryName;
    map["categoryNameAr"] = _categoryNameAr;
    map["categoryIcon"] = _categoryIcon;
    map["venueCategoryParent"] = _venueCategoryParent;
    return map;
  }

}

class VenueTimes {
  int? venueTimeId;
  String? dayName;
  String? dayNameAr;
  String? openTime;
  String? openTimeAr;
  String? closeTime;
  String? closeTimeAr;
  int? venueId;

  VenueTimes(
      {this.venueTimeId,
        this.dayName,
        this.dayNameAr,
        this.openTime,
        this.openTimeAr,
        this.closeTime,
        this.closeTimeAr,
        this.venueId});

  VenueTimes.fromJson(Map<String, dynamic> json) {
    venueTimeId = json['venueTimeId'];
    dayName = json['dayName'];
    dayNameAr = json['dayNameAr'];
    openTime = json['openTime'];
    openTimeAr = json['openTimeAr'];
    closeTime = json['closeTime'];
    closeTimeAr = json['closeTimeAr'];
    venueId = json['venueId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['venueTimeId'] = this.venueTimeId;
    data['dayName'] = this.dayName;
    data['dayNameAr'] = this.dayNameAr;
    data['openTime'] = this.openTime;
    data['openTimeAr'] = this.openTimeAr;
    data['closeTime'] = this.closeTime;
    data['closeTimeAr'] = this.closeTimeAr;
    data['venueId'] = this.venueId;
    return data;
  }
}

class VenueReviews {
  int? venueReviewId;
  int? ratting;
  String? review;
  String? title;
  double? createAt;
  int? venueId;
  int? memberId;
  String? memberName;
  String? profilePicture;

  VenueReviews(
      {this.venueReviewId,
        this.ratting,
        this.review,
        this.title,
        this.createAt,
        this.venueId,
        this.memberId,
        this.memberName,
        this.profilePicture});

  VenueReviews.fromJson(Map<String, dynamic> json) {
    venueReviewId = json['venueReviewId'];
    ratting = json['ratting'];
    review = json['review'];
    title = json['title'];
    createAt = json['createAt'];
    venueId = json['venueId'];
    memberId = json['memberId'];
    memberName = json['memberName'];
    profilePicture = json['profilePicture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['venueReviewId'] = this.venueReviewId;
    data['ratting'] = this.ratting;
    data['review'] = this.review;
    data['title'] = this.title;
    data['createAt'] = this.createAt;
    data['venueId'] = this.venueId;
    data['memberId'] = this.memberId;
    data['memberName'] = this.memberName;
    data['profilePicture'] = this.profilePicture;
    return data;
  }
}