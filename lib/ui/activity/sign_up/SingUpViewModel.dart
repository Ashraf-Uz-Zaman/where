import 'dart:convert';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:where/constant/GenderEnum.dart';
import 'package:where/network/ApiUtils.dart';
import 'package:where/network/model/AllCityModel.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:where/network/model/MemberProfileImageModel.dart';
import 'package:where/network/model/MemberProfileModel.dart';
import 'package:where/utils/ErrorUtils.dart';

class SingUpViewModel {
  Dio dio = new Dio();
  List<GenderEnum> genders = GenderEnum.getGenders();


  List<DropdownMenuItem<GenderEnum>> dropDownListGender() {
    List<DropdownMenuItem<GenderEnum>> dropDownGenderlist = [];
    for (GenderEnum gender in genders) {
      dropDownGenderlist.add(
        DropdownMenuItem(
          child: Container(
            child: Text(gender.name),
            alignment: Alignment.center,
          ),
          value: gender,
        ),
      );
    }
    return dropDownGenderlist;
  }

  List<DropdownMenuItem<Cities>> dropDownListCities(final cities) {
    List<DropdownMenuItem<Cities>> dropDownGenderlist = [];
    for (Cities city in cities) {
      dropDownGenderlist.add(
        DropdownMenuItem(
          child: Container(
            child: Text(city.name!),
            alignment: Alignment.center,
          ),
          value: city,
        ),
      );
    }
    return dropDownGenderlist;
  }

  Future<AllCityModel> getAllCityName() async {
    var res = await http.get(Uri.parse(ApiUtils.ALL_CITY_NAME_URL));
    if (res.statusCode == 200) {
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
      final data = json.decode(res.body);
      AllCityModel model = AllCityModel.fromJson(data);
      return model;
    } else {
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
      throw "Unable to retrieve posts.";
    }
  }

  Future<MemberProfileImageModel> uploadImage(filepath) async {
    String fileName = filepath.path.split('/').last;
    FormData data = FormData.fromMap({
      "Image": await MultipartFile.fromFile(
        filepath.path,
        filename: fileName,
      ),
    });
    Response response =
        await dio.post(ApiUtils.MEMBER_PROFILE_PICTURE_UPLOAD_URL, data: data);
    if (response.statusCode == 200) {
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
      MemberProfileImageModel models = MemberProfileImageModel.fromJson(response.data);
      return models;
    }
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
    throw "Unable to retrieve posts.";
  }

  Future<MemberProfileModel> postMemberProfile(firstName,lastName,phoneNumber,email,userName,aboutMe,dateOfBirth,gender,profilePicture,postCode,address,password,cityId,location) async {
    var res = await http.post(Uri.parse(ApiUtils.MEMBER_PROFILE_CREATE_URL), body: {
    'FirstName': firstName,
    'LastName': lastName,
    'UserName': userName,
    'DateOfBirth': dateOfBirth,
    'Gender': gender,
    'AboutMe': aboutMe,
    'Password': password,
    'PhoneNumber': phoneNumber,
    'Email': email,
    'CityId': cityId,
    'PostCode': postCode,
    'Address': address,
    'ProfilePicture': firstName,
    'Location': location,
    'Latitude': "24.926294766395593",
    'Longitude': "55.82153320312501",
    'Token': "e58d7020ebd4",
    }  );
    if (res.statusCode == 200) {
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
      final data = json.decode(res.body);
      print(data);
      MemberProfileModel model = MemberProfileModel.fromJson(data);
      return model;
    } else {
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
      throw "Unable to retrieve posts.";
    }
  }


  String fieldValidation( String value){

    if(value.isEmpty){
      return ErrorUtils.FIELD_EMPTY;
    }
    else{
      return ErrorUtils.FIELD_OK;
    }
  }

  String passwordValidation(String password, String re_passowrd){
    if(password.isEmpty){
      return ErrorUtils.PASSWORD_EMPTY;
    }
    else if(password.length <= 6){
      return ErrorUtils.PASSWORD_LENGTH;
    }
    else if(!validateStructure(password)){
      return ErrorUtils.PASSWORD_STRUCTURE;
    }
    else if(password != re_passowrd){
      return ErrorUtils.PASSWORD_NOT_MATCH;
    }
    else if(password == re_passowrd){
      return ErrorUtils.PASSWORD_OK;
    }
    else{
      return ErrorUtils.ERROR_OCCURED;
    }
  }

  bool validateStructure(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
