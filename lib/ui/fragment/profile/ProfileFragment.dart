import 'package:flutter/material.dart';
import 'package:where/data/pref/Pref.dart';
import 'package:where/network/model/member_profile_info_model.dart';
import 'package:where/ui/fragment/profile/ProfileViewModel.dart';
import 'package:where/ui/fragment/profile/follow/Follow.dart';
import 'package:where/ui/fragment/profile/item_profile_image/ItemProfileImage.dart';
import 'package:where/ui/widget/ColoredSafeArea.dart';
import 'package:where/ui/widget/CurveColorButton.dart';
import 'package:where/utils/NavigateUtils.dart';
import 'package:where/where_icons.dart';
import 'package:where/utils/ImageUtils.dart';
import 'package:where/utils/StringValueUtils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'item_profile_image/ItemProfileImageLoader.dart';

class ProfileFragment extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileFragment> {
  final viewModel = ProfileViewModel();
  final prefs = Pref();
  MemberProfileInfoModel model = MemberProfileInfoModel();
  bool imageLoaded = false;
  @override
  void initState() {
    prefs.getInt(Pref.memberId).then((value) {
      switch (value) {
        case -1:
          break;
        default:
          ItemProfileImageLoader( status: true,);
          viewModel.getMemberStories(value.toString()).then((value) {
            model = value;
            setState(() {
              imageLoaded = true;
            });
          }).onError((error, stackTrace)  {
            ItemProfileImageLoader( status: false,);
          });
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
          ),
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                margin: EdgeInsets.only(top: 12),
                child: Column(
                  children: [
                    topSide(),
                    SizedBox(
                      height: 24,
                    ),
                    secoundSide(),
                    SizedBox(
                      height: 12,
                    ),
                    detailsFields(),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 14, right: 14),
                      alignment: Alignment.centerLeft,
                      child:   CurveColorButton(name: StringValueUtils.EDIT_PROFILE, pressAction: () {NavigateUtils.JumpToEditProfile(context, model);}),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Divider(
                      indent: 24,
                      endIndent: 24,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    highLightsTextField(),
                    SizedBox(
                      height: 6,
                    ),
                    buildHighLightsListView(),
                    SizedBox(
                      height: 8,
                    ),
                    myGalleryTextField(),
                    SizedBox(
                      height: 6,
                    ),
                    buildMyGalleryListView(),
                    SizedBox(
                      height: 8,
                    ),
                    topPicksTextField(),
                    SizedBox(
                      height: 6,
                    ),
                    buildTopPicksListView(),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ))),
    );
  }

  // TopSide Potion
  Widget topSide() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(flex: 1, child: imageLoaded ? Follow(title: StringValueUtils.FOLLOWERS, icons: Following.following, quantity: model.data!.member!.followingCount!.toString()) : Follow(title: StringValueUtils.FOLLOWERS, icons: Following.following, quantity: "0")),
        Flexible(flex: 1, child: imageLoaded ? ItemProfileImage(img: model.data!.member!.profilePicture!, color: Color(int.parse(model.data!.member!.memberLevel!.color!.replaceAll("#","ff" ).toLowerCase(), radix: 16)),) : ItemProfileImageLoader( status: false,)),
        Flexible(flex: 1, child: imageLoaded ? Follow(title: StringValueUtils.FOLLOWING, icons: Follower.follower, quantity: model.data!.member!.followerCount!.toString()):Follow(title: StringValueUtils.FOLLOWING, icons: Follower.follower, quantity: "0"))
      ],
    );
  }



// 2nd Potion

  Widget secoundSide() {
    return Container(
        margin: EdgeInsets.only(left: 14, right: 14),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  imageLoaded ?  Text(
                    model.data!.member!.firstName!+ " " +model.data!.member!.lastName!,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white),
                  ): Text(""),
                  SizedBox(
                    height: 5,
                  ),
                  imageLoaded ? Text(
                    "@"+model.data!.member!.userName!,
                    style: TextStyle(fontSize: 13, color: Colors.white54),
                  ):Text("")
                ],
              ),
            ),
            SizedBox(
              width: 3,
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerRight,
                child: FaIcon(
                  FontAwesomeIcons.crown,
                  color: Colors.yellow,
                  size: 20,
                ),
              ),
            )
          ],
        ));
  }

  Widget detailsFields() {
    return Container(
      margin: EdgeInsets.only(left: 14, right: 14),
      alignment: Alignment.topLeft,
      child: imageLoaded ?  Text(model.data!.member!.aboutMe!,
        style: TextStyle(color: Colors.white, fontSize: 13),
        textAlign: TextAlign.justify,
      ) : Text(""),
    );
  }


  Widget highLightsTextField() {
    return Container(
        margin: EdgeInsets.only(top: 10, left: 14),
        alignment: Alignment.topLeft,
        child: Text(
          StringValueUtils.HIGHLIGHT,
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ));
  }

  Widget buildHighLightsListView() {
    return Container(
      margin: EdgeInsets.only(left: 4, right: 14),
      child: SizedBox(
        height: 86,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (_, index) {
            return highLightsCard();
          },
        ),
      ),
    );
  }

  Widget highLightsCard() {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            "images/m1.jpg",
            fit: BoxFit.cover,
            height: 86,
            width: 130,
          )),
    );
  }

  Widget myGalleryTextField() {
    return Container(
        margin: EdgeInsets.only(top: 10, left: 14),
        alignment: Alignment.topLeft,
        child: Text(
          StringValueUtils.MY_GALLERY,
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ));
  }

  Widget buildMyGalleryListView() {
    return Container(
        margin: EdgeInsets.only(left: 4, right: 14),
        child: SizedBox(
          height: 86,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (_, index) {
              return myGalleryCard();
            },
          ),
        ));
  }

  Widget myGalleryCard() {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            "images/m2.jpg",
            fit: BoxFit.cover,
            height: 86,
            width: 130,
          )),
    );
  }

  Widget topPicksTextField() {
    return Container(
        margin: EdgeInsets.only(top: 10, left: 14),
        alignment: Alignment.topLeft,
        child: Text(
          StringValueUtils.MY_BOOKED_TABLES,
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ));
  }

  Widget buildTopPicksListView() {
    return Container(
        margin: EdgeInsets.only(left: 4, right: 14),
        child: SizedBox(
          height: 86,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (_, index) {
              return topPicksCard();
            },
          ),
        ));
  }

  Widget topPicksCard() {
    return Container(
      margin: EdgeInsets.only(left: 10),
      alignment: Alignment.topLeft,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            "images/m1.jpg",
            fit: BoxFit.cover,
            height: 86,
            width: 130,
          )),
    );
  }
}
