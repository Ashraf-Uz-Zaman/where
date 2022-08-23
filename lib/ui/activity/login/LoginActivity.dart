import 'package:flutter/material.dart';
import 'package:where/data/pref/Pref.dart';
import 'package:where/network/model/login_model.dart';
import 'package:where/network/services/ApiResponse.dart';
import 'package:where/ui/activity/bottom_nav/BottomNavActivity.dart';
import 'package:where/ui/activity/forgot_password/ForgetPasswordActivity.dart';
import 'package:where/ui/activity/login/LoginViewModel.dart';
import 'package:where/ui/activity/sign_up/SignUpActivity.dart';
import 'package:where/ui/widget/ColoredSafeArea.dart';
import 'package:where/ui/widget/CurveColorButton.dart';
import 'package:where/ui/widget/CurveEditText.dart';
import 'package:where/ui/widget/utils/ButtonUtils.dart';
import 'package:where/ui/widget/utils/TextUtils.dart';
import 'package:where/utils/ErrorUtils.dart';
import 'package:where/utils/ImageUtils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:where/utils/StringValueUtils.dart';

class LoginActivity extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginActivity> {
  LoginModel model = LoginModel();
  final buttonUtils = ButtonUtils();
  final textUtils = TextUtils();
  final viewModel =LoginViewModel();
  final pres = Pref();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    viewModel.loginStream!.listen((event) {
      switch (event.status) {
        case Status.LOADING:
          EasyLoading.show(status: event.message! + '...');
          break;
        case Status.COMPLETED:
          EasyLoading.dismiss();
          model = event.data!;
          switch (model.code) {
            case 200:
              pres.putBool(Pref.SIGN_IN, true);
              pres.putString(Pref.address, model.data!.address.toString());
              pres.putString(Pref.memberFirstName, model.data!.memberFirstName.toString());
              pres.putString(Pref.memberLastName, model.data!.memberLastName.toString());
              pres.putString(Pref.venueName, model.data!.venueName.toString());
              pres.putInt(Pref.venueId, model.data!.venueId!.toInt());
              pres.putInt(Pref.memberId, model.data!.memberId!.toInt());
              pres.putString(Pref.token, model.data!.token.toString());
              Navigator.of(context).push( MaterialPageRoute(builder: (context) => BottomNavActivity()));
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
      resizeToAvoidBottomInset: false,
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageUtils.LOGIN_BACKGROUND),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              topImage(),
              textAccountField(),
              emailTextField(),
              passwordTextField(),
              buttonField(),
              textORField(),
              buttonAccountField(),
              textBottomField()
            ],
          ),
        ),

    ));
  }

  Widget topImage() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      alignment: Alignment.topCenter,
      child: Image.asset(
        ImageUtils.WHERE_LOGO,
          height: 84.8,
          width:  198.4,
          fit:BoxFit.fill
      ),
    );
  }

  Widget textAccountField() {
    return Container(
        margin: EdgeInsets.only(
          top: 37,
          left: 60,
          right: 60,
        ),
        alignment: Alignment.topCenter,
        child: Text(
          StringValueUtils.ALREADY_HAVE_AN_ACCOUNT,
          style: TextStyle(
            fontSize: 19.0,
            color: Colors.white,
          ),
        ));
  }

  Widget emailTextField() {
    return Container(
        margin: EdgeInsets.only(
          top: 20,
          left: 25,
          right: 25,
        ),
        alignment: Alignment.topCenter,
        child: CurveEditText(
      hints: StringValueUtils.PHONE_EMAIL_USER,transparent: true,
      controller: loginController ),);
  }

  Widget passwordTextField() {
    return Container(
        margin: EdgeInsets.only(
          top: 10,
          left: 25,
          right: 25,
        ),
        alignment: Alignment.topCenter,
    child: CurveEditText(
      hints: StringValueUtils.PASSWORD,transparent: true, notVisibleText: true,
      controller: passwordController ),);
  }

  Widget buttonField() {
    return Container(
        margin: EdgeInsets.only(
          top: 10,
          left: 25,
          right: 25,
        ),
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CurveColorButton(name: StringValueUtils.SING_IN, pressAction:(){


              if(viewModel.fieldValidation(loginController.text.toString())== ErrorUtils.FIELD_EMPTY){

              }else if(viewModel.fieldValidation(passwordController.text.toString())== ErrorUtils.FIELD_EMPTY){

              }else{

                viewModel.fetchBookingTableList(loginController.text.toString(), passwordController.text.toString());


              }
            }),
            TextButton(
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPasswordActivity()));},
              child: Text(
                StringValueUtils.FORGET_PASSWORD,
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
            ),
          ],
        ));
  }

  Widget textORField() {
    return Container(
        margin: EdgeInsets.only(
          top: 10,
        ),
        alignment: Alignment.topCenter,
        child: Text(
          StringValueUtils.OR,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ));
  }


  Widget buttonAccountField() {
    return Container(
        margin: EdgeInsets.only(
          top: 20,
          left: 25,
          right: 25,
        ),
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: double.infinity,child: TextButton(
              onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpActivity()));},
              child: Text(
                StringValueUtils.ACCOUNT,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.only(
                      top: 12,
                      bottom: 12,),
                ),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white70),
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                        side: BorderSide(color: Colors.white))),
              ),
            ),),
            SizedBox(
              width: double.infinity,child:  TextButton(
              onPressed: () {},
              child: Text(
                StringValueUtils.BISNUESS_ACCOUNT,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.only(
                      top: 12,
                      bottom: 12,),
                ),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white70),
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                        side: BorderSide(color: Colors.white))),
              ),
            ),),
          ],
        ));
  }

  Widget textBottomField() {
    return Container(
        margin: EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 25,
          right: 25,
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
        ));
  }
}
