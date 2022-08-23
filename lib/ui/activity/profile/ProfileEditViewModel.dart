import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:where/constant/GenderEnum.dart';
import 'package:where/network/ApiUtils.dart';
import 'package:where/network/model/AllCityModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ProfileEditViewModel {
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

  dynamic getIcon(String value) {
    var icon = Icons.male;
    switch (value) {
      case "Female":
        icon = Icons.female;
        break;
      case "Other":
        icon = Icons.transgender;
        break;
      default:
        icon = Icons.male;
        break;
    }
    return icon;
  }

  dynamic getGenderValueInit(value) {
    if (value == genders[1].name)
      return genders[1];
    else if (value == genders[2].name)
      return genders[2];
    else
      return genders[0];
  }

  dynamic getCityValueInit(value, AllCityModel model) {
    var data = model.data!.cities![0];
    for(int i = 0;i<model.data!.cities!.length;i++){
      if(value == model.data!.cities![i].name.toString()){
        data = model.data!.cities![i];
        break;
      }
    }
    return data;
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
}
