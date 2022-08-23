import 'package:flutter/material.dart';
import 'package:where/network/model/member_profile_info_model.dart';
import 'package:where/network/services/ApiResponse.dart';
import 'package:where/ui/fragment/loyality_card/LoyalityCardViewModel.dart';
import 'package:where/ui/widget/ColoredSafeArea.dart';
import 'package:where/ui/widget/CustomTextLoader.dart';
import 'package:where/ui/widget/CustomeText.dart';
import 'package:where/utils/ImageUtils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:where/data/pref/Pref.dart';

class LoyalityCardFragment extends StatefulWidget {
  @override
  _LoyalityCardState createState() => _LoyalityCardState();
}

class _LoyalityCardState extends State<LoyalityCardFragment> {
  MemberProfileInfoModel model = MemberProfileInfoModel();
  final viewModel = LoyalityCardViewModel();
  final prefs = Pref();
  String nameTxt = "";
  String pointTxt = "";
  String tireTxt = "";
  bool dataLoad = false;

  @override
  void initState() {
    api_fetching();
    prefs.getInt(Pref.memberId).then((value) {
      switch (value) {
        case -1:
          break;
        default:
         viewModel.fetchMemberInfo(value.toString());
          break;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Image.asset(
            ImageUtils.WHERE_LOGO,
            fit: BoxFit.contain,
            height: 45,
          ),
          centerTitle: true,
        ),
        body: Center(
            child: Container(
          height: 330,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        topLeft: Radius.circular(8)),
                  ),
                ),
              ),
              Positioned(
                top: 36,
                right: 0,
                left: 0,
                child: Container(
                  height: 3,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              Positioned(
                  top: 45,
                  right: 0,
                  left: 0,
                  child: Container(
                    alignment: Alignment.center,
                    child: Image.asset(ImageUtils.WHERE_LOGO,
                        height: 65, width: 152, fit: BoxFit.fill),
                  )),
              Positioned(
                  top: 135,
                  right: 0,
                  left: 0,
                  child: Row(
                    children: [
                      Flexible(flex: 1, fit: FlexFit.tight, child: point()),
                      Flexible(flex: 1, fit: FlexFit.tight, child: name()),
                      Flexible(flex: 1, fit: FlexFit.tight, child: tire()),
                    ],
                  )),
              Positioned(
                bottom: 65,
                right: 65,
                left: 65,
                child: Image.asset(
                  'images/testing_barcode.png',
                  height: 45,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 36,
                right: 0,
                left: 0,
                child: Container(
                  height: 3,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  Widget point() {
    return Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/points_loyalty_card.png',
              width: 28,
              height: 28,
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomeText(
                  title: "Points",
                  colors: Colors.grey,
                  size: 11.5,
                ),
                SizedBox(
                  height: 2,
                ),
              dataLoad ?   CustomeText(
                  title: pointTxt,
                  colors: Colors.black,
                  size: 13.5,
                ) : CustomeTextLoader(height: 13.5, width: 30,)
              ],
            )
          ],
        ));
  }

  Widget name() {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'images/member_name_loyalty_card.png',
          width: 28,
          height: 28,
        ),
        SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomeText(
              title: "Member Name",
              colors: Colors.grey,
              size: 11.5,
            ),
            SizedBox(
              height: 2,
            ),
            dataLoad ? CustomeText(
              title: nameTxt,
              colors: Colors.black,
              size: 13.5,
            ): CustomeTextLoader(height: 13.5, width: 70,)
          ],
        )
      ],
    ));
  }

  Widget tire() {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'images/tier_loyalty_card.png',
          width: 28,
          height: 28,
        ),
        SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomeText(
              title: "Tier",
              colors: Colors.grey,
              size: 11.5,
            ),
            SizedBox(
              height: 2,
            ),
            dataLoad ? CustomeText(
              title: tireTxt,
              colors: Colors.black,
              size: 13.5,
            ): CustomeTextLoader(height: 13.5, width: 47,)
          ],
        )
      ],
    ));
  }


  void api_fetching() {
    viewModel.memberInfoStream!.listen((event) {
      switch (event.status) {
        case Status.LOADING:
          EasyLoading.show(status: event.message! + '...');

          break;
        case Status.COMPLETED:
          EasyLoading.dismiss();
          model = event.data!;
          switch (model.code) {
            case 200:
              setState(() {
              dataLoad = true;
              nameTxt = model.data!.member!.firstName.toString()+" "+model.data!.member!.lastName.toString();
              pointTxt = model.data!.member!.memberLevel!.point.toString();
              tireTxt = model.data!.member!.memberLevel!.levelName.toString();
              });
              break;
            default:
              setState(() {
                dataLoad = false;

              });
              EasyLoading.showError(model.message!);
              break;
          }
          break;
        case Status.ERROR:
          setState(() {
            dataLoad = false;
          });
          EasyLoading.dismiss();
          EasyLoading.showError(event.message!);
          break;
      }
    });


  }
}
