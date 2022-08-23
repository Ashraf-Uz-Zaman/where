import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:where/ui/activity/splash/SplashActivity.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(MyApp());
  EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.wave;
  EasyLoading.instance.maskType = EasyLoadingMaskType.black;
  EasyLoading.instance.loadingStyle = EasyLoadingStyle.dark;
  EasyLoading.instance.displayDuration = const Duration(milliseconds: 1200);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Where',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.black,
          ),
      debugShowCheckedModeBanner: false,
      home: SplashActivity(),
      builder: EasyLoading.init(),
    );
  }
}
