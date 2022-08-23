import 'package:flutter/material.dart';
import 'package:where/constant/GenderEnum.dart';
import 'package:where/network/model/AllCityModel.dart';
import 'package:where/network/model/member_profile_info_model.dart';
import 'package:where/ui/activity/profile/ProfileEditViewModel.dart';
import 'package:where/ui/activity/profile/image/ProfileImage.dart';
import 'package:where/ui/activity/profile/text/TextMultilineProfile.dart';
import 'package:where/ui/activity/profile/text/TextProfile.dart';
import 'package:where/ui/widget/ColoredSafeArea.dart';
import 'package:expandable/expandable.dart';
import 'package:where/ui/widget/CurveColorButton.dart';
import 'package:where/ui/widget/ExpandCollapse.dart';
import 'package:where/utils/ColorUtils.dart';
import 'package:where/utils/ImageUtils.dart';
import 'package:where/utils/StringValueUtils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditActivity extends StatefulWidget {
  MemberProfileInfoModel model;

  ProfileEditActivity(this.model);

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEditActivity> {
  final viewModel = ProfileEditViewModel();
  double sizebox_height = 8;
  XFile? _image;
  bool imagePickflag = false;
  final ImagePicker imagePicker = ImagePicker();
  List<DropdownMenuItem<GenderEnum>> dropDownGenderlist = [];
  List<DropdownMenuItem<Cities>> dropDownAllCitylist = [];
  late GenderEnum genderValue;
  late Cities citiesValue = Cities();
  late String cityTextValue;
  var _icons = Icons.male;

  final nameController = TextEditingController();
  bool nameEdit = false;
  final userNameController = TextEditingController();
  bool userNameEdit = false;
  final aboutMeController = TextEditingController();
  bool aboutMeEdit = false;
  final passwordController = TextEditingController();
  bool passwordEdit = false;
  final totalSpentController = TextEditingController();
  bool totalSpentEdit = false;
  final phoneController = TextEditingController();
  bool phoneEdit = false;
  final emailController = TextEditingController();
  bool emailEdit = false;
  final addressController = TextEditingController();
  bool addressEdit = false;
  final postCodeController = TextEditingController();
  bool postCodeEdit = false;

  bool cityEdit = false;
  bool genderIconEdit = false;
  bool CityDataLoad = false;

  @override
  void initState() {
    nameController.text = (widget.model.data!.member!.firstName.toString() +
        " " +
        widget.model.data!.member!.lastName.toString());
    userNameController.text = widget.model.data!.member!.userName.toString();
    aboutMeController.text = widget.model.data!.member!.aboutMe.toString();
    phoneController.text = widget.model.data!.member!.phoneNumber.toString();
    addressController.text = widget.model.data!.member!.address.toString();
    emailController.text = widget.model.data!.member!.email.toString();
    postCodeController.text = widget.model.data!.member!.postCode.toString();
    cityTextValue = widget.model.data!.member!.city!.name.toString();
    dropDownGenderlist = viewModel.dropDownListGender();
    genderValue = viewModel
        .getGenderValueInit(widget.model.data!.member!.gender.toString());
    _icons = viewModel.getIcon(genderValue.name);

    EasyLoading.show(status: 'Loading...');
    viewModel.getAllCityName().then((value) {
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
      citiesValue = viewModel.getCityValueInit(cityTextValue, value);
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
          title: Image.asset(
            ImageUtils.WHERE_LOGO,
            fit: BoxFit.contain,
            height: 45,
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
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
                  expand: Text(""),
                  collapse: personalDetails()),
              ExpandCollapse(
                  title: StringValueUtils.CONTRACT_DETAILS,
                  expand: contractDetails(),
                  collapse: Text("")),
              ExpandCollapse(
                  title: StringValueUtils.ADDRESS,
                  expand: address(),
                  collapse: Text("")),
              Container(
                  margin: EdgeInsets.only(
                    top: sizebox_height,
                    left: 12,
                  ),
                  child: Row(children: [
                    CurveColorButton(
                        name: StringValueUtils.DONE, pressAction: () {})
                  ])),
              SizedBox(
                height: 8,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget personalDetails() {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          imageProfile(),
          TextProfile(
            title: "Name",
            controller: nameController,
            type: TextInputType.text,
            notVisibleText: false,
            edit: nameEdit,
            visible: true,
            dividerVisible: true,
            onTap: () {
              setState(() {
                nameEdit = !nameEdit;
              });
            },
          ),
          TextProfile(
            title: "Username",
            controller: userNameController,
            type: TextInputType.text,
            notVisibleText: false,
            edit: userNameEdit,
            visible: true,
            dividerVisible: true,
            onTap: () {
              setState(() {
                userNameEdit = !userNameEdit;
              });
            },
          ),

          iconProfile(),
          TextMultilineProfile(
            title: "About Me",
            controller: aboutMeController,
            type: TextInputType.text,
            notVisibleText: false,
            edit: aboutMeEdit,
            visible: true,
            dividerVisible: true,
            onTap: () {
              setState(() {
                aboutMeEdit = !aboutMeEdit;
              });
            },
          ),
          TextProfile(
            title: "Password",
            controller: passwordController,
            type: TextInputType.text,
            notVisibleText: true,
            edit: passwordEdit,
            visible: true,
            dividerVisible: true,
            onTap: () {
              setState(() {
                passwordEdit = !passwordEdit;
              });
            },
          ),
          TextProfile(
            title: "Total Spent",
            controller: totalSpentController,
            type: TextInputType.text,
            notVisibleText: true,
            edit: totalSpentEdit,
            visible: false,
            dividerVisible: true,
            onTap: () {
              setState(() {
                totalSpentEdit = !totalSpentEdit;
              });
            },
          ),
          Divider(
            thickness: 1,
            color: Colors.grey.shade600,
          ),
          // TextProfile(title: "Password", description: "description", lines: 1, controller: nameController, type: TextInputType.text, notVisibleText: true,error: null,),
        ],
      ),
    );
  }

  Widget contractDetails() {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          TextProfile(
            title: "Phone",
            controller: phoneController,
            type: TextInputType.text,
            notVisibleText: false,
            edit: phoneEdit,
            visible: true,
            dividerVisible: false,
            onTap: () {
              setState(() {
                phoneEdit = !phoneEdit;
              });
            },
          ),
          TextProfile(
            title: "Email",
            controller: emailController,
            type: TextInputType.text,
            notVisibleText: false,
            edit: emailEdit,
            visible: true,
            dividerVisible: true,
            onTap: () {
              setState(() {
                emailEdit = !emailEdit;
              });
            },
          ),
          Divider(
            thickness: 1,
            color: Colors.grey.shade600,
          ),
          // TextProfile(title: "Password", description: "description", lines: 1, controller: nameController, type: TextInputType.text, notVisibleText: true,error: null,),
        ],
      ),
    );
  }

  Widget address() {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          cityProfile(),
          TextProfile(
            title: "Post Code",
            controller: postCodeController,
            type: TextInputType.text,
            notVisibleText: false,
            edit: postCodeEdit,
            visible: true,
            dividerVisible: true,
            onTap: () {
              setState(() {
                postCodeEdit = !postCodeEdit;
              });
            },
          ),
          TextProfile(
            title: "Address",
            controller: addressController,
            type: TextInputType.text,
            notVisibleText: false,
            edit: addressEdit,
            visible: true,
            dividerVisible: true,
            onTap: () {
              setState(() {
                addressEdit = !addressEdit;
              });
            },
          ),
          Divider(
            thickness: 1,
            color: Colors.grey.shade600,
          ),
          // TextProfile(title: "Password", description: "description", lines: 1, controller: nameController, type: TextInputType.text, notVisibleText: true,error: null,),
        ],
      ),
    );
  }

  Widget iconProfile() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          thickness: 1,
          color: Colors.grey.shade600,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Gender:",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
              maxLines: 1,
            ),
            SizedBox(
              width: 5,
            ),
            Visibility(
              visible: genderIconEdit,
              child: Flexible(
                child: DropdownButton(
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                  elevation: 3,
                  iconSize: 30.0,
                  iconEnabledColor: Colors.white,
                  isExpanded: true,
                  dropdownColor: Colors.grey,
                  underline: Container(),
                  value: genderValue,
                  items: dropDownGenderlist,
                  onChanged: (value) {
                    setState(() {
                      genderValue = value as GenderEnum;
                      _icons = viewModel.getIcon(genderValue.name);
                    });
                  },
                  hint: Container(
                    child: Text("Select item"),
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ),
            Visibility(
                visible: !genderIconEdit,
                child: Column(
                  children: [
                    SizedBox(height: 12),
                    Icon(
                      _icons,
                      color: Colors.white,
                    ),
                    SizedBox(height: 12),
                  ],
                )),
            Spacer(),
            InkWell(
              onTap: () {
                setState(() {
                  genderIconEdit = !genderIconEdit;
                });
              },
              child: Container(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: Text(genderIconEdit ? "Done" : "Edit",
                    style: TextStyle(
                        fontSize: 13,
                        color: ColorUtils.colorAppDefaultBlue,
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget cityProfile() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          thickness: 1,
          color: Colors.grey.shade600,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "City" + ":",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
              maxLines: 1,
            ),
            SizedBox(
              width: 4,
            ),
            Visibility(
              visible: cityEdit,
              child: Flexible(
                child: CityDataLoad
                    ? DropdownButton(
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                        elevation: 3,
                        iconSize: 30.0,
                        iconEnabledColor: Colors.white,
                        isExpanded: true,
                        dropdownColor: Colors.grey,
                        underline: Container(),
                        value: citiesValue,
                        items: dropDownAllCitylist,
                        onChanged: (value) {
                          setState(() {
                            citiesValue = value as Cities;
                            cityTextValue = citiesValue.name.toString();
                            // _icons = viewModel.getIcon(genderValue.name);
                          });
                        },
                        hint: Container(
                          child: Text("Select item"),
                          alignment: Alignment.center,
                        ),
                      )
                    : Text(""),
              ),
            ),
            Visibility(
              visible: !cityEdit,
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Text(
                    cityTextValue,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                    maxLines: 1,
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                setState(() {
                  cityEdit = !cityEdit;
                });
              },
              child: Container(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: Text(cityEdit ? "Done" : "Edit",
                    style: TextStyle(
                        fontSize: 13,
                        color: ColorUtils.colorAppDefaultBlue,
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget imageProfile() {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {imgFromCamera();},
              child: Container(
                height: 50,
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 12),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: ColorUtils.colorAppDefaultBlue,
                  size: 24,
                ),
              ),
            )),
        Expanded(
          flex: 1,
          child: ProfileImage(
            type: imagePickflag,
              img: widget.model.data!.member!.profilePicture!,
              color: Color(int.parse(
                  widget.model.data!.member!.memberLevel!.color!
                      .replaceAll("#", "ff")
                      .toLowerCase(),
                  radix: 16)),image: _image,),
        ),
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () {imgFromGallery();},
            child: Container(
              height: 50,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 12),
              child: Icon(
                Icons.photo_library_outlined,
                color: ColorUtils.colorAppDefaultBlue,
                size: 24,
              ),
            ),
          ),
        )
      ],
    );
  }

  imgFromCamera() async {
    XFile? image = await imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
      imagePickflag = true;
    });
  }

  imgFromGallery() async {
    XFile? image = await imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
      imagePickflag = true;
      // if (!EasyLoading.isShow) {
      //   EasyLoading.show(status: 'Uploading...');
      // }
      // viewModel.uploadImage(image).then((value) {
      //   fileName = value.data!.filename.toString();
      // });
    });
  }
}
