import 'dart:convert';

CategoriesModel welcomeFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

String welcomeToJson(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel {
  CategoriesModel({
     this.data,
     this.code,
     this.message,
    this.isSuccess,
  });

  Data? data;
  int? code;
  String? message;
  bool? isSuccess;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
    data: Data.fromJson(json["data"]) ,
    code: json["code"],
    message: json["message"],
    isSuccess: json["isSuccess"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "code": code,
    "message": message,
    "isSuccess": isSuccess,
  };
}

class Data {
  Data({
    required this.parentCategory,
  });

  List<ParentCategory> parentCategory;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    parentCategory: List<ParentCategory>.from(json["parentCategory"].map((x) => ParentCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "parentCategory": List<dynamic>.from(parentCategory.map((x) => x.toJson())),
  };
}

class ParentCategory {
  ParentCategory({
    required this.venueCategoryId,
    required this.categoryName,
    required this.categoryNameAr,
    required this.categoryIcon,
    required this.venueCategoryParent,
  });

  int venueCategoryId;
  String categoryName;
  String categoryNameAr;
  String categoryIcon;
  dynamic venueCategoryParent;

  factory ParentCategory.fromJson(Map<String, dynamic> json) => ParentCategory(
    venueCategoryId: json["venueCategoryId"],
    categoryName: json["categoryName"],
    categoryNameAr: json["categoryNameAr"],
    categoryIcon: json["categoryIcon"],
    venueCategoryParent: json["venueCategoryParent"],
  );

  Map<String, dynamic> toJson() => {
    "venueCategoryId": venueCategoryId,
    "categoryName": categoryName,
    "categoryNameAr": categoryNameAr,
    "categoryIcon": categoryIcon,
    "venueCategoryParent": venueCategoryParent,
  };
}
