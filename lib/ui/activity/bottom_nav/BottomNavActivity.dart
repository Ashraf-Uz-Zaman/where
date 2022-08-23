import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:where/ui/fragment/add/AddFragment.dart';
import 'package:where/ui/fragment/home/HomeFragment.dart';
import 'package:where/ui/fragment/loyality_card/LoyalityCardFragment.dart';
import 'package:where/ui/fragment/notification/NotificationFragment.dart';
import 'package:where/ui/fragment/profile/ProfileFragment.dart';
import 'package:where/ui/widget/ColoredSafeArea.dart';
import 'package:where/utils/ColorUtils.dart';
import 'package:where/where_icons.dart';

class BottomNavActivity extends StatefulWidget {
  @override
  BottomNavState createState() => BottomNavState();
}

class BottomNavState extends State<BottomNavActivity> {
  bool isHide = false;

  List<Widget> _buildFragment() {
    return [
      HomeFragment(),
      LoyalityCardFragment(),
      AddFragment(),
      NotificationFragment(),
      ProfileFragment()
    ];
  }


  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(BottomNavIcon.home,size: 24,),
        textStyle: TextStyle(fontSize: 10),
        title: ("Home"),
        activeColorPrimary: ColorUtils.colorAppDefaultBlue,
        inactiveColorPrimary: CupertinoColors.black,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.credit_card,size: 26,),
        textStyle: TextStyle(fontSize: 10),
        title: ("Loyality Card"),
        activeColorPrimary: ColorUtils.colorAppDefaultBlue,
        inactiveColorPrimary: CupertinoColors.black,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(BottomNavIcon.plus,size: 32,),
        activeColorPrimary: ColorUtils.colorAppDefaultBlue,
        inactiveColorPrimary: CupertinoColors.black,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(BottomNavIcon.bell,size: 24),
        title: ("Notification"),
        textStyle: TextStyle(fontSize: 10),
        activeColorPrimary: ColorUtils.colorAppDefaultBlue,
        inactiveColorPrimary: CupertinoColors.black,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(BottomNavIcon.profile,size: 24),
        title: ("Profile"),
        textStyle: TextStyle(fontSize: 10),
        activeColorPrimary: ColorUtils.colorAppDefaultBlue,
        inactiveColorPrimary: CupertinoColors.black,
      ),
    ];
  }

  PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
        child: Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildFragment(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        hideNavigationBar: isHide,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        popAllScreensOnTapOfSelectedTab: false,
        hideNavigationBarWhenKeyboardShows: true,
        navBarStyle: NavBarStyle.simple,
      ),
    ));
  }
}
