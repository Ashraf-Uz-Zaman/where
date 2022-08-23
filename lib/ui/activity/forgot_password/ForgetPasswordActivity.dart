import 'dart:async';

import 'package:flutter/material.dart';
import 'package:where/network/model/ForgetPasswordModel.dart';
import 'package:where/network/model/OtpModel.dart';
import 'package:where/network/model/UpdatePasswordModel.dart';
import 'package:where/network/services/ApiResponse.dart';
import 'package:where/ui/activity/forgot_password/ForgetPasswordViewModel.dart';
import 'package:where/ui/widget/ColoredSafeArea.dart';
import 'package:where/ui/widget/CurveColorButton.dart';
import 'package:where/ui/widget/CurveEditText.dart';
import 'package:where/ui/widget/utils/ButtonUtils.dart';
import 'package:where/ui/widget/utils/TextUtils.dart';
import 'package:where/utils/ErrorUtils.dart';
import 'package:where/utils/ImageUtils.dart';
import 'package:where/utils/StringValueUtils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ForgetPasswordActivity extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPasswordActivity> {
  ForgetPasswordModel forgetPasswordModel = ForgetPasswordModel();
  OtpModel otpModel = OtpModel();
  UpdatePasswordModel updateModel = UpdatePasswordModel();
  final viewModel = ForgetPasswordViewModel();
  final textUtils = TextUtils();
  final buttonUtils = ButtonUtils();

  int index = 0;
  String member_id = "";

  final forgetPasswordController = TextEditingController();
  final authenticationController = TextEditingController();
  final newPasswordController = TextEditingController();
  final reNewPasswordController = TextEditingController();



  @override
  void initState() {
    api_fetching();
    super.initState();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
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
              setState(() {
                if (index == 0) {
                  Navigator.of(context).pop();
                } else {
                  index--;
                }
              });
            },
          ),
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Visibility(
              child: forgetPasswordField(),
              visible: index == 0 ? true : false,
            ),
            Visibility(
              child: authenticationField(),
              visible: index == 1 ? true : false,
            ),
            Visibility(
              child: passwordAssistanceField(),
              visible: index == 2 ? true : false,
            )
          ],
        ),
      ),
    );
  }

  Widget titleField(String title) {
    return Container(
        margin: EdgeInsets.only(
          top: 37,
          left: 29.58,
          right: 29.58,
        ),
        alignment: Alignment.topCenter,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 19.0,
            color: Colors.white,
          ),
        ));
  }

  Widget forgetPasswordField() {
    return Container(
      margin: EdgeInsets.only(
        top: 6,
        left: 20,
        right: 20,
      ),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          titleField(StringValueUtils.FORGET_PASSWORDS),
          SizedBox(
            height: 15,
          ),

          CurveEditText(
            hints: StringValueUtils.EMAIL_ADDRESS_OR_PHONE_NO,transparent: false,
            controller: forgetPasswordController, ),
          Container(
            margin: EdgeInsets.only(
              top: 15,
            ),
            alignment: Alignment.topLeft,
            child: CurveColorButton(
                name: StringValueUtils.SUBMIT,
                pressAction: () {
                  switch (forgetPasswordController.text.trim().length) {
                    case 0:
                      break;
                    default:
                      viewModel.fetchForgetPassword(forgetPasswordController.text);


                      break;
                  }

                }),
          )
        ],
      ),
    );
  }

  Widget authenticationField() {
    return Container(
      margin: EdgeInsets.only(
        top: 6,
        left: 20,
        right: 20,
      ),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          titleField(StringValueUtils.AUTHENTICATION_REQUIRED),
          Container(
              margin: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              alignment: Alignment.topCenter,
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                style: TextStyle(
                  fontSize: 11.0,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
              )),
          Container(
            margin: EdgeInsets.only(
              top: 15,
            ),
            alignment: Alignment.topCenter,

          child: CurveEditText(
            hints: StringValueUtils.ENTER_OTP,transparent: false,
            controller: authenticationController, ),),
          Container(
            margin: EdgeInsets.only(
              top: 15,
            ),
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CurveColorButton(
                    name: StringValueUtils.SUBMIT,
                    pressAction: () {
                      switch (authenticationController.text.trim().length) {
                        case 0:
                          break;
                        default:
                          viewModel.fetchOTP(forgetPasswordController.text,authenticationController.text);

                          break;
                      }
                    }),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    StringValueUtils.RESEND_OTP,
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget passwordAssistanceField() {
    return Container(
      margin: EdgeInsets.only(
        top: 6,
        left: 20,
        right: 20,
      ),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          titleField(StringValueUtils.PASSWORD_ASSISTANCE),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            alignment: Alignment.topCenter,
            child: Text(
              StringValueUtils.WE_WILL_ASK_THE,
              style: TextStyle(
                fontSize: 11.0,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 15,
            ),
            alignment: Alignment.topCenter,
            child: CurveEditText(
                hints: StringValueUtils.ENTER_NEW_PASSWORD,transparent: false,
                controller: newPasswordController, ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 3),
            alignment: Alignment.topLeft,
            child: Text(
              StringValueUtils.PASSWORD_MUST_BE_ATLEAST_6,
              style: TextStyle(
                fontSize: 11.0,
                color: Colors.white70,
              ),
              textAlign: TextAlign.left,
              overflow: TextOverflow.clip,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 12,
            ),
            alignment: Alignment.topCenter,
            child:

          CurveEditText(
            hints: StringValueUtils.RE_ENTER_NEW_PASSWORD,transparent: false,
            controller: reNewPasswordController),),
          Container(
            margin: EdgeInsets.only(
              top: 15,
            ),
            alignment: Alignment.topLeft,
            child: CurveColorButton(
                name: StringValueUtils.SAVE_CHANGES,
                pressAction: () {
                switch(
                viewModel.passwordValidation(newPasswordController.text, reNewPasswordController.text.toString())){
                  case ErrorUtils.PASSWORD_OK:
                    viewModel.fetchUpdate(member_id, newPasswordController.text);
                    break;
                  default:
                    EasyLoading.showError(viewModel.passwordValidation(newPasswordController.text.toString(), reNewPasswordController.text.toString()));
                    break;
                }

                }),
          )
        ],
      ),
    );
  }

  void api_fetching(){
    viewModel.forgetPasswordStream!.listen((event) {
      switch (event.status) {
        case Status.LOADING:
          EasyLoading.show(status: event.message! + '...');
          break;
        case Status.COMPLETED:
          EasyLoading.dismiss();
          forgetPasswordModel = event.data!;
          print(forgetPasswordModel.data!.token.toString());
          switch (forgetPasswordModel.code) {
            case 200:
              setState(() {
                index++;
              });
              break;
            default:
              EasyLoading.showError(event.data!.message!);
              break;
          }

          break;
        case Status.ERROR:
          EasyLoading.dismiss();
          EasyLoading.showError(event.message!);
          break;
      }
    }
    );


    viewModel.otpStream!.listen((event) {
      switch (event.status) {
        case Status.LOADING:
          EasyLoading.show(status: event.message! + '...');
          break;
        case Status.COMPLETED:
          EasyLoading.dismiss();
          otpModel = event.data!;
          switch (otpModel.code) {
            case 200:
              setState(() {
                member_id = otpModel.data!.memberId.toString();
                index++;
              });
              break;
            default:
              EasyLoading.showError(event.data!.message!);
              break;
          }

          break;
        case Status.ERROR:
          EasyLoading.dismiss();
          EasyLoading.showError(event.message!);
          break;
      }
    });

    viewModel.updateStream!.listen((event) {
      switch (event.status) {
        case Status.LOADING:
          EasyLoading.show(status: event.message! + '...');
          break;
        case Status.COMPLETED:
          EasyLoading.dismiss();
          updateModel = event.data!;
          switch (updateModel.code) {
            case 200:
              EasyLoading.showSuccess(updateModel.message!);
              Timer( Duration(milliseconds: 1250), () {
                Navigator.of(context).pop();
              });
              break;
              break;
            default:
              EasyLoading.showError(event.data!.message!);
              break;
          }

          break;
        case Status.ERROR:
          EasyLoading.dismiss();
          EasyLoading.showError(event.message!);
          break;
      }
    });
  }
}
