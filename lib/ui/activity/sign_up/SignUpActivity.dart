import 'dart:async';

import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/painting.dart';
import 'package:where/constant/GenderEnum.dart';
import 'package:where/network/model/AllCityModel.dart';
import 'package:where/ui/activity/sign_up/SingUpViewModel.dart';
import 'package:where/ui/widget/ColoredSafeArea.dart';
import 'package:where/ui/widget/CurveColorButton.dart';
import 'package:where/ui/widget/CurveDropDown.dart';
import 'package:where/ui/widget/CurveEditText.dart';
import 'package:where/ui/widget/CurveMultilineEditText.dart';
import 'package:where/ui/widget/ExpandCollapse.dart';
import 'package:where/utils/AlertUtils.dart';
import 'package:where/utils/ColorUtils.dart';
import 'package:where/utils/ErrorUtils.dart';
import 'package:where/utils/StringValueUtils.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SignUpActivity extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpActivity> {
  final viewModel = SingUpViewModel();
  final alertStyle = AlertUtils();
  final ImagePicker imagePicker = ImagePicker();
  List<DropdownMenuItem<GenderEnum>> dropDownGenderlist = [];
  List<DropdownMenuItem<Cities>> dropDownAllCitylist = [];
  var date_of_birth = 'Date of Birth';
  late GenderEnum genderValue;
  late Cities citiesValue;
  bool CityDataLoad = false;

  double sizebox_height = 8;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final aboutMeController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfarmationController = TextEditingController();

  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final postCodeController = TextEditingController();

  // Error
  var firstNameError = "";
  var lastNameError = "";
  var userNameError = "";
  var aboutMeError = "";
  var passwordError = "";
  var phoneError = "";
  var emailError = "";
  var addressError = "";
  var postCodeError = "";

  String fileName = "";

  XFile? _image;

  @override
  void initState() {
    dropDownGenderlist = viewModel.dropDownListGender();
    genderValue = viewModel.genders[0];
    EasyLoading.show(status: 'Loading...');
    viewModel.getAllCityName().then((value) {
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
      citiesValue = value.data!.cities![0];
      dropDownAllCitylist = viewModel.dropDownListCities(value.data!.cities!);
      setState(() {
        CityDataLoad = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            StringValueUtils.CREATE_YOUR_ACCOUNT,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: Colors.black,
        body: ExpandableTheme(
          data: const ExpandableThemeData(
            iconColor: Colors.white,
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            iconSize: 32,
            useInkWell: true,
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              ExpandCollapse(
                  title: StringValueUtils.PERSONAL_DETAILS,
                  expand: personaDetails(),
                  collapse: Text("")),
              ExpandCollapse(
                  title: StringValueUtils.CONTRACT_DETAILS,
                  expand: contractDetails(),
                  collapse: Text("")),
              ExpandCollapse(
                  title: StringValueUtils.ADDRESS,
                  expand: addressDetails(),
                  collapse: Text("")),
              Container(
                  margin: EdgeInsets.only(
                    top: sizebox_height,
                    left: 16,
                  ),
                  child: Row(children: [
                    CurveColorButton(
                        name: StringValueUtils.SUBMIT,
                        pressAction: () {
                          if (viewModel.fieldValidation(
                                  firstNameController.text.trim().toString()) ==
                              ErrorUtils.FIELD_EMPTY) {
                            setState(() {
                              firstNameError = "Required";
                            });
                          } else if (viewModel.fieldValidation(
                                  lastNameController.text.trim().toString()) ==
                              ErrorUtils.FIELD_EMPTY) {
                            setState(() {
                              firstNameError = "";
                              lastNameError = "Required";
                            });
                          } else if (viewModel.fieldValidation(
                                  userNameController.text.trim().toString()) ==
                              ErrorUtils.FIELD_EMPTY) {
                            setState(() {
                              firstNameError = "";
                              lastNameError = "";
                              userNameError = "Required";
                            });
                          } else if (date_of_birth == "Date of Birth") {
                            alertDialogError(
                                "Date of birth", "please select you dob");
                          } else if (fileName == "") {
                            alertDialogError("Profile", "please pick an image");
                          } else if (viewModel.fieldValidation(
                                  aboutMeController.text.trim().toString()) ==
                              ErrorUtils.FIELD_EMPTY) {
                            setState(() {
                              firstNameError = "";
                              lastNameError = "";
                              userNameError = "";
                              aboutMeError = "Required";
                            });
                          } else if (viewModel.passwordValidation(
                                  passwordController.text.toString(),
                                  passwordConfarmationController.text
                                      .toString()) !=
                              ErrorUtils.PASSWORD_OK) {
                            alertDialogError(
                                "Password",
                                viewModel.passwordValidation(
                                    passwordController.text.toString(),
                                    passwordConfarmationController.text
                                        .toString()));
                            setState(() {
                              firstNameError =  "";
                              lastNameError = "";
                              userNameError = "";
                              aboutMeError = "";
                              passwordError = viewModel.passwordValidation(
                                  passwordController.text.toString(),
                                  passwordConfarmationController.text
                                      .toString());
                            });
                          } else if (viewModel.fieldValidation(
                                  phoneController.text.trim().toString()) ==
                              ErrorUtils.FIELD_EMPTY) {
                            setState(() {
                              firstNameError = "";
                              lastNameError = "";
                              userNameError = "";
                              aboutMeError = "";
                              passwordError = "";
                              phoneError = "Required";
                            });
                          } else if (viewModel.fieldValidation(
                                  emailController.text.trim().toString()) ==
                              ErrorUtils.FIELD_EMPTY) {
                            setState(() {
                              firstNameError =  "";
                              lastNameError = "";
                              userNameError = "";
                              aboutMeError = "";
                              passwordError = "";
                              phoneError = "";
                              emailError = "Required";
                            });
                          } else if (viewModel.fieldValidation(
                                  postCodeController.text.trim().toString()) ==
                              ErrorUtils.FIELD_EMPTY) {
                            setState(() {
                              firstNameError =  "";
                              lastNameError = "";
                              userNameError = "";
                              aboutMeError = "";
                              passwordError = "";
                              phoneError = "";
                              emailError = "";
                              postCodeError = "Required";
                            });

                          } else if (viewModel.fieldValidation(
                                  addressController.text.trim().toString()) ==
                              ErrorUtils.FIELD_EMPTY) {
                            setState(() {
                              firstNameError =  "";
                              lastNameError = "";
                              userNameError = "";
                              aboutMeError = "";
                              passwordError = "";
                              phoneError = "";
                              emailError = "";
                              postCodeError = "";
                              addressError = "Required";
                            });
                          } else {
                            if (!EasyLoading.isShow) {
                              EasyLoading.show(status: 'Creating profile...');
                            }
                            viewModel
                                .postMemberProfile(
                                    firstNameController.text.trim().toString(),
                                    lastNameController.text.trim().toString(),
                                    phoneController.text.trim().toString(),
                                    emailController.text.trim().toString(),
                                    userNameController.text.trim().toString(),
                                    aboutMeController.text.trim().toString(),
                                    date_of_birth.toString(),
                                    genderValue.name.toString(),
                                    fileName,
                                    postCodeController.text.trim().toString(),
                                    addressController.text.trim().toString(),
                                    passwordController.text.trim().toString(),
                                    citiesValue.cityId.toString(),
                                    citiesValue.countryName.toString())
                                .then((value) {
                              EasyLoading.showSuccess(value.message.toString());
                              Timer(Duration(milliseconds: 1250), () {
                                Navigator.of(context).pop();
                              });
                            });
                          }
                        }),
                  ])),
            ],
          ),
        ),
      ),
    );
  }

  // To-Do: personal Details

  Widget personaDetails() {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          CurveEditText(
            hints: StringValueUtils.FIRST_NAME,
            transparent: false,
            error: firstNameError == "" ? null : firstNameError,
            controller: firstNameController,
          ),
          SizedBox(
            height: sizebox_height,
          ),
          CurveEditText(
            hints: StringValueUtils.LAST_NAME,
            transparent: false,
            error: lastNameError == "" ? null : lastNameError,
            controller: lastNameController,
          ),
          SizedBox(
            height: sizebox_height,
          ),
          CurveEditText(
            hints: StringValueUtils.USER_NAME,
            transparent: false,
            error: userNameError == "" ? null : userNameError,
            controller: userNameController,
          ),
          SizedBox(
            height: sizebox_height,
          ),
          dataOfBirthUserTextField(),
          SizedBox(
            height: sizebox_height,
          ),
          dropDownField(),
          SizedBox(
            height: sizebox_height,
          ),
          CurveMultilineEditText(
            hints: StringValueUtils.ABOUT_ME,
            controller: aboutMeController,
          ),
          SizedBox(
            height: sizebox_height,
          ),
          CurveEditText(
            hints: StringValueUtils.PASSWORD,
            transparent: false,
            notVisibleText: true,
            error: passwordError == "" ? null : passwordError,
            controller: passwordController,
          ),
          SizedBox(
            height: sizebox_height,
          ),
          CurveEditText(
            hints: StringValueUtils.PASSWORD_CONFIRMATION,
            transparent: false,
            notVisibleText: true,
            controller: passwordConfarmationController,
          ),
        ],
      ),
    );
  }

  Widget dataOfBirthUserTextField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(24),
      ),
      alignment: Alignment.topCenter,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.only(
            top: 5,
            bottom: 5,
            left: 20,
          ),
        ),
        onPressed: () {
          DatePicker.showDatePicker(context,
              showTitleActions: true,
              minTime: DateTime(1990, 1, 1),
              maxTime: DateTime(2050, 12, 30),
              onChanged: (date) {}, onConfirm: (date) {
            setState(() {
              date_of_birth = DateFormat('dd-MMMM-yyyy').format(date);
            });
          }, currentTime: DateTime.now(), locale: LocaleType.en);
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            date_of_birth,
            style: TextStyle(fontSize: 15.0, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget dropDownField() {
    return Row(
      children: [
        Flexible(
            flex: 1,
            child: CurveDropDown(
              change: (value) {
                setState(() {
                  genderValue = value;
                });
              },
              value: genderValue,
              list: dropDownGenderlist,
            )),
        SizedBox(
          width: 5,
        ),
        Flexible(
          flex: 2,
          child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(24),
              ),
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  alertDialog("Choose", "image pick from");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Profile Picture',
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.camera_alt_outlined,
                      size: 22,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Container(
                      height: 26,
                      child:
                          VerticalDivider(color: Colors.white, thickness: .2),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Icon(
                      Icons.image_rounded,
                      size: 22,
                      color: Colors.white,
                    )
                  ],
                ),
              )),
        )
      ],
    );
  }

  // To-Do: Contract Details

  Widget contractDetails() {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          CurveEditText(
            hints: StringValueUtils.PHONE_NO,
            transparent: false,
            error: phoneError == "" ? null : phoneError,
            controller: phoneController,
            type: TextInputType.phone,
          ),
          SizedBox(
            height: sizebox_height,
          ),
          CurveEditText(
            hints: StringValueUtils.EMAIL,
            transparent: false,
            error: emailError == "" ? null : emailError,
            controller: emailController,
            type: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }

  // To-Do: Address Details

  Widget addressDetails() {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: CityDataLoad
                    ? CurveDropDown(
                        change: (value) {
                          setState(() {
                            citiesValue = value;
                          });
                        },
                        value: citiesValue,
                        list: dropDownAllCitylist,
                      )
                    : CurveDropDown(
                        change: (value) {},
                        value: 0,
                        list: dropDownAllCitylist,
                      ),
              ),
              Flexible(
                flex: 1,
                child: Text(""),
              )
            ],
          ),
          SizedBox(
            height: sizebox_height,
          ),
          CurveEditText(
            hints: StringValueUtils.POST_CODE,
            transparent: false,
            error: postCodeError == "" ? null : postCodeError,
            controller: postCodeController,
          ),
          SizedBox(
            height: sizebox_height,
          ),
          CurveMultilineEditText(
            hints: StringValueUtils.ADDRESS,
            controller: addressController,
          )
        ],
      ),
    );
  }

  void alertDialog(String title, String des) {
    Alert(
        context: context,
        title: title,
        type: AlertType.none,
        desc: des,
        style: alertStyle.AlertStyles(),
        buttons: [
          DialogButton(
            child: Text(
              "Camera",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onPressed: () {
              Navigator.pop(context);
              Timer(Duration(milliseconds: 210), () {
                imgFromCamera();
              });
            },
            color: ColorUtils.colorAppDefaultBlue,
            radius: BorderRadius.circular(4.0),
          ),
          DialogButton(
            child: Text(
              "Gallery",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onPressed: () {
              Navigator.pop(context);
              Timer(Duration(milliseconds: 210), () {
                imgFromGallery();
              });
            },
            color: ColorUtils.colorAppDefaultBlue,
            radius: BorderRadius.circular(4.0),
          )
        ]).show();
  }

  void alertDialogError(String title, String des) {
    Alert(
        context: context,
        title: title,
        type: AlertType.warning,
        desc: des,
        buttons: [
          DialogButton(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onPressed: () {
              Navigator.pop(context);
              Timer(Duration(milliseconds: 210), () {
                imgFromCamera();
              });
            },
            color: ColorUtils.colorAppDefaultBlue,
            radius: BorderRadius.circular(4.0),
          ),
        ]).show();
  }

  imgFromCamera() async {
    XFile? image = await imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  imgFromGallery() async {
    XFile? image = await imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
      if (!EasyLoading.isShow) {
        EasyLoading.show(status: 'Uploading...');
      }
      viewModel.uploadImage(image).then((value) {
        fileName = value.data!.filename.toString();
      });
    });
  }
}
