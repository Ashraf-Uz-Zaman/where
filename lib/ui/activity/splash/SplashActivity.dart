import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:where/data/pref/Pref.dart';
import 'package:where/ui/activity/bottom_nav/BottomNavActivity.dart';
import 'package:where/ui/activity/introduction/IntroductionActivity.dart';
import 'package:where/utils/ImageUtils.dart';
import 'package:where/utils/ScreenResulationUtils.dart';

class SplashActivity extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashActivity>
    with SingleTickerProviderStateMixin {
  final pres = Pref();
  bool navToFlag = false;

  @override
  void initState() {
    pres.getBool(Pref.SIGN_IN).then((value) {
      setState(() {
        navToFlag = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[splash_background(), splash_logo()]),
    );
  }

  Widget splash_background() {
    final screenSize = MediaQuery.of(context).size;
    ScreenResulationUtils.HEIGHT = screenSize.height;
    ScreenResulationUtils.WIDTH = screenSize.width;
    return Container(
      height: screenSize.height,
      decoration: new BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(ImageUtils.SPLASH_BACKGROUND),
        ),
      ),
    );
  }

  Widget splash_logo() {
    return AnimatedSplashScreen(
      duration: 3000,
      splashIconSize: 200,
      splash: Image.asset(ImageUtils.SPLASH_LOGO),
      nextScreen: navToFlag ? BottomNavActivity() : IntroductionActivity(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.transparent,
    );
  }
}
