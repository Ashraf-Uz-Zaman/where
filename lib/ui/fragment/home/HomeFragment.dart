import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:where/data/pref/Pref.dart';
import 'package:where/network/model/CategoriesModel.dart';

import 'package:where/network/model/MemberStoryModel.dart';
import 'package:where/network/model/RecentlyAddedHomeModel.dart';
import 'package:where/network/model/TendingHomeModel.dart';
import 'package:where/network/model/TopPicksHomeModel.dart';
import 'package:where/network/services/ApiResponse.dart';
import 'package:where/ui/activity/location/LocationActivity.dart';
import 'package:where/ui/activity/messege/MessageActivity.dart';
import 'package:where/ui/activity/my_booking/MyBookingActivity.dart';
import 'package:where/ui/activity/terms_and_condition/TermsAndConditionsActivity.dart';
import 'package:where/ui/activity/top_picks/TopPicksActivity.dart';
import 'package:where/ui/activity/trending_now/TrendingNowActivity.dart';
import 'package:where/ui/fragment/home/HomeViewModel.dart';
import 'package:where/ui/fragment/home/circular_image/CircularImage.dart';
import 'package:where/ui/fragment/home/item_where/ItemWhere.dart';
import 'package:where/ui/widget/ColoredSafeArea.dart';
import 'package:where/ui/widget/utils/TextUtils.dart';
import 'package:where/utils/AlertUtils.dart';
import 'package:where/utils/ColorUtils.dart';
import 'package:where/utils/ImageUtils.dart';
import 'package:where/utils/NavigateUtils.dart';
import 'package:where/utils/StringValueUtils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'circular_image/CircularImageLoader.dart';
import 'item_categories/ItemCategories.dart';
import 'item_categories/ItemCategoriesLoader.dart';
import 'item_where/ItemWhereLoader.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomeFragment extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeFragment> {
  CategoriesModel categoriesModel = CategoriesModel();
  MemberStoryModel memberStoryModel = MemberStoryModel();
  TopPicksHomeModel topPicksHomeModel = TopPicksHomeModel();
  TendingHomeModel tendingHomeModel = TendingHomeModel();
  RecentlyAddedHomeModel recentlyAddedHomeModel = RecentlyAddedHomeModel();
  final viewModel = HomeViewModel();
  final textUtils = TextUtils();
  final prefs = Pref();
  final alertStyle = AlertUtils();
  int venueCategoryId = -1;

  int categoriesIndex = 0;
  int memberID = -1;
  bool categoriesFlag = false;
  bool categoriesLoad = false;
  bool memberFlag = false;
  bool memberLoad = false;
  bool topPricksFlag = false;
  bool topPricksLoad = false;
  bool tendingFlag = false;
  bool tendingLoad = false;
  bool recentlyFlag = false;
  bool recentlyLoad = false;

  @override
  void initState() {
    api_fetching();
    viewModel.fetchCategories();

    prefs.getInt(Pref.memberId).then((value) {
      switch (value) {
        case -1:
          break;
        default:
          memberID = value;
          break;
      }
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
        actions: [
          TextButton.icon(
            icon: Icon(Icons.check_circle_outlined, color: Colors.white),
            label: Text('Check-in',
                style: TextStyle(
                  color: Colors.white,
                )),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => LocationActivity()),
              );
            },
          )
        ],
      ),
      backgroundColor: Colors.black,
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: ColorUtils.colorAppDefaultBlue,
              ),
              accountName: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Andr Thomas",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                          size: 15,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Jumerah Lake Town",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    )
                  ]),
              accountEmail: Text(""),
            ),
            ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              title: Text("Your Booking"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MyBookingActivity()),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text("Where Top picks"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TopPicksActivity()),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text("Where Trending Now"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => TrendingNowActivity()),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text("Message"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MessageActivity()),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text("T & C"),
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(milliseconds: 600), () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => TermsAndConditionsActivity()),
                  );
                });
              },
            ),
            Divider(),
            ListTile(
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              title: Text("Logout"),
              onTap: () {
                Navigator.pop(context);
                alertDialog("Login Out", "Do you want to logout ?");
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            searchField(),
            SizedBox(
              height: 12,
            ),
            memberStoryField(),
            SizedBox(
              height: 8,
            ),
            categoriesField(),
            SizedBox(
              height: 5,
            ),
            bottomTitleTextField(StringValueUtils.TOP_PICKS),
            SizedBox(
              height: 3,
            ),
            topPicks(),
            SizedBox(
              height: 5,
            ),
            bottomTitleTextField(StringValueUtils.WHERE_TRENDING_NOW),
            SizedBox(
              height: 3,
            ),
            tending(),
            SizedBox(
              height: 5,
            ),
            bottomTitleTextField(StringValueUtils.WHERE_RECENTLY_ADDED),
            SizedBox(
              height: 3,
            ),
            recentlyAdded(),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    ));
  }

  Widget searchField() {
    return Container(
      margin: EdgeInsets.only(
        top: 6,
        left: 38,
        right: 38,
      ),
      alignment: Alignment.topCenter,
      child: TextFormField(
        keyboardType: TextInputType.text,
        autofocus: false,
        obscureText: false,
        cursorColor: Colors.white,
        style: textUtils.CurveTextStyle(),
        decoration: textUtils.CurveInputIconDecoration(StringValueUtils.SEARCH),
      ),
    );
  }

  Widget memberStoryField() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.add, size: 24, color: Colors.black),
          ),
          SizedBox(
            width: 7,
          ),
          Flexible(
              child: memberID != -1 && memberFlag
                  ? buildFriendStoryList(memberStoryModel)
                  : CircularImageLoader(status: memberLoad))
        ],
      ),
    );
  }

  Widget buildFriendStoryList(MemberStoryModel model) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: model.data!.stories!.length,
        itemBuilder: (_, index) {
          return CircularImage(
            true,
            img: model.data!.stories![index].profilePicture!,
            online: true,
            name: model.data!.stories![index].memberName!,
            color: Color(int.parse(
                model.data!.stories![index].levelColor!
                    .replaceAll("#", "ff")
                    .toLowerCase(),
                radix: 16)),
          );
        },
      ),
    );
  }

  Widget categoriesField() {
    return categoriesFlag
        ? SizedBox(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categoriesModel.data!.parentCategory.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          categoriesIndex = index;
                          venueCategoryId = categoriesModel
                              .data!.parentCategory[index].venueCategoryId;
                          viewModel.fetchTopPicks(venueCategoryId.toString());
                          viewModel.fetchTending(venueCategoryId.toString());
                          viewModel.fetchRecently(venueCategoryId.toString());
                        });
                      },
                      child: categoriesIndex == index
                          ? ItemCategories(
                              name: categoriesModel
                                  .data!.parentCategory[index].categoryName,
                              img: categoriesModel
                                  .data!.parentCategory[index].categoryIcon,
                              status: true,
                            )
                          : ItemCategories(
                              name: categoriesModel
                                  .data!.parentCategory[index].categoryName,
                              img: categoriesModel
                                  .data!.parentCategory[index].categoryIcon,
                              status: false,
                            ));
                }),
          )
        : ItemCategoriesLoader(
            status: categoriesLoad,
          );
  }

  Widget bottomTitleTextField(String title) {
    return Container(
        margin: EdgeInsets.only(top: 10, left: 14),
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14.5,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ));
  }

  Widget topPicks() {
    return topPricksFlag
        ? Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 4, right: 14),
            child: SizedBox(
              height: 90,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: topPicksHomeModel.data!.venues!.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          NavigateUtils.JumpToBookingTable(context,
                              topPicksHomeModel.data!.venues![index].venueId!);
                        });
                      },
                      child: ItemWhere(
                        img: topPicksHomeModel.data!.venues![index].mainImage!,
                      ),
                    );
                  }),
            ),
          )
        : ItemWhereLoader(status: topPricksLoad);
  }

  Widget tending() {
    return tendingFlag
        ? Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 4, right: 14),
            child: SizedBox(
              height: 90,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: tendingHomeModel.data!.venues!.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          NavigateUtils.JumpToBookingTable(context,
                              tendingHomeModel.data!.venues![index].venueId!);
                        });
                      },
                      child: ItemWhere(
                        img: tendingHomeModel.data!.venues![index].mainImage!,
                      ),
                    );
                  }),
            ),
          )
        : ItemWhereLoader(status: tendingLoad);
  }

  Widget recentlyAdded() {
    return recentlyFlag
        ? Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 4, right: 14),
            child: SizedBox(
              height: 90,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: recentlyAddedHomeModel.data!.venues!.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          NavigateUtils.JumpToBookingTable(
                              context,
                              recentlyAddedHomeModel
                                  .data!.venues![index].venueId!);
                        });
                      },
                      child: ItemWhere(
                        img: recentlyAddedHomeModel
                            .data!.venues![index].mainImage!,
                      ),
                    );
                  }),
            ),
          )
        : ItemWhereLoader(status: recentlyLoad);
  }

  void alertDialog(String title, String des) {
    Alert(
        context: context,
        title: title,
        type: AlertType.warning,
        desc: des,
        style: alertStyle.AlertStylesHorizontal(),
        buttons: [
          DialogButton(
            child: Text(
              "Yes",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
              prefs.putBool(Pref.SIGN_IN, false);

              Timer(Duration(milliseconds: 210), () {
                exit(0);
              });
            },
            color: ColorUtils.colorAppDefaultBlue,
            radius: BorderRadius.circular(4.0),
          ),
          DialogButton(
            child: Text(
              "No",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
              // SystemNavigator.pop();
            },
            color: ColorUtils.colorAppDefaultBlue,
            radius: BorderRadius.circular(4.0),
          )
        ]).show();
  }

  void api_fetching() {
    viewModel.categoriesStream!.listen((event) {
      switch (event.status) {
        case Status.LOADING:
          setState(() {
            categoriesLoad = true;
          });

          break;
        case Status.COMPLETED:
          categoriesModel = event.data!;
          switch (categoriesModel.code) {
            case 200:
              setState(() {
                categoriesLoad = false;
                venueCategoryId =
                    categoriesModel.data!.parentCategory[0].venueCategoryId;
                categoriesFlag = true;
                // memberFlag = true;
              });
              viewModel.fetchMemberStories(memberID.toString());
              break;
            default:
              setState(() {
                categoriesLoad = false;
              });
              EasyLoading.showError(categoriesModel.message!);
              break;
          }
          break;
        case Status.ERROR:
          setState(() {
            categoriesLoad = false;
          });
          EasyLoading.showError(event.message!);
          break;
      }
    });

    viewModel.memberStoryStream!.listen((event) {
      switch (event.status) {
        case Status.LOADING:
          setState(() {
            memberLoad = true;
          });
          break;
        case Status.COMPLETED:
          memberStoryModel = event.data!;
          switch (memberStoryModel.code) {
            case 200:
              setState(() {
                memberLoad = false;
                memberFlag = true;
              });
              if(venueCategoryId != -1){
                viewModel.fetchTopPicks(venueCategoryId.toString());
                viewModel.fetchTending(venueCategoryId.toString());
                viewModel.fetchRecently(venueCategoryId.toString());
              }
              break;
            default:
              setState((){
                memberLoad = false;
              });
              EasyLoading.showError(memberStoryModel.message!);
              break;
          }

          break;
        case Status.ERROR:
          setState((){
            memberLoad = false;
          });
          EasyLoading.showError(event.message!);
          break;
      }
    });

    viewModel.topPicksStream!.listen((event) {
      switch (event.status) {
        case Status.LOADING:
          setState(() {
            topPricksLoad = true;
          });
          break;
        case Status.COMPLETED:
          topPicksHomeModel = event.data!;
          switch (topPicksHomeModel.code) {
            case 200:
              setState(() {
                topPricksLoad = false;
                topPricksFlag = true;
              });
              break;
            default:
              setState(() {
                topPricksLoad = false;
              });
              // EasyLoading.showError(topPicksHomeModel.message!);
              break;
          }

          break;
        case Status.ERROR:
          setState(() {
            topPricksLoad = false;
          });
          // EasyLoading.showError(event.message!);
          break;
      }
    });

    viewModel.tendingStream!.listen((event) {
      switch (event.status) {
        case Status.LOADING:
          setState(() {
            tendingLoad = true;
          });
          break;
        case Status.COMPLETED:
          tendingHomeModel = event.data!;
          switch (tendingHomeModel.code) {
            case 200:
              setState(() {
                tendingLoad = false;
                tendingFlag = true;
              });
              break;
            default:
              setState(() {
                tendingLoad = false;
              });
              break;
          }

          break;
        case Status.ERROR:
          setState(() {
            tendingLoad = false;
          });
          // EasyLoading.showError(event.message!);
          break;
      }
    });

    viewModel.recentlyAddedStream!.listen((event) {
      switch (event.status) {
        case Status.LOADING:
          setState(() {
            recentlyLoad = true;
          });
          break;
        case Status.COMPLETED:
          recentlyAddedHomeModel = event.data!;
          switch (recentlyAddedHomeModel.code) {
            case 200:
              setState(() {
                recentlyFlag = true;
                recentlyLoad = false;
              });
              break;
            default:
              setState(() {
                recentlyLoad = false;
              });
              break;
          }

          break;
        case Status.ERROR:
          setState(() {
            recentlyLoad = false;
          });
          // EasyLoading.showError(event.message!);
          break;
      }
    });
  }
}
