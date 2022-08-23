import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:where/helper/SliderPage.dart';
import 'package:where/ui/activity/login/LoginActivity.dart';
import 'package:where/ui/widget/ColoredSafeArea.dart';
import 'package:where/utils/ColorUtils.dart';
import 'package:where/utils/ImageUtils.dart';
import 'package:where/utils/ScreenResulationUtils.dart';

class IntroductionActivity extends StatefulWidget {
  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<IntroductionActivity> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
        title: "Search",
        description:
            "Discover Restaurants offering the best fast food food near you on Foodwa.",
        image: ImageUtils.INTRODUCTION_BACKGROUND),
    SliderPage(
        title: "Order",
        description:
            "Our veggie plan is filled with delicious seasonal vegetables, whole grains, beautiful cheeses and vegetarian proteins.",
        image: ImageUtils.INTRODUCTION_BACKGROUND),
    SliderPage(
        title: "Eat",
        description:
            "Food delivery or pickup from local restaurants, Explore restaurants that deliver near you.",
        image: ImageUtils.INTRODUCTION_BACKGROUND),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
      child: Scaffold(
        backgroundColor: ColorUtils.colorAppDefaultBlue,
        body: Stack(
          children: <Widget>[
            PageView.builder(
              scrollDirection: Axis.horizontal,
              onPageChanged: _onchanged,
              controller: _controller,
              itemCount: _pages.length,
              itemBuilder: (context, int index) {
                return _pages[index];
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(_pages.length, (int index) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: ScreenResulationUtils.HEIGHT / 92.6,
                        // width: (index == _currentPage) ? 10 : 10,
                        width: (index == _currentPage)
                            ? ScreenResulationUtils.WIDTH / 42.8
                            : ScreenResulationUtils.WIDTH / 42.8,
                        margin: EdgeInsets.symmetric(
                            horizontal: ScreenResulationUtils.HEIGHT / 185.2,
                            vertical: ScreenResulationUtils.WIDTH / 10.2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: (index == _currentPage)
                                ? Border.all(color: Colors.black, width: 1)
                                : Border.all(color: Colors.grey, width: 1),
                            color: (index == _currentPage)
                                ? Colors.white
                                : ColorUtils.colorAppDefaultBlue),
                      );
                    })),
                InkWell(
                  onTap: () {
                    _currentPage < _pages.length - 1
                        ? _controller.nextPage(
                            duration: Duration(milliseconds: 800),
                            curve: Curves.easeInOutQuint)
                        : jumpTo();
                  },
                  child: AnimatedContainer(
                      alignment: Alignment.center,
                      duration: Duration(milliseconds: 300),
                      height: ScreenResulationUtils.HEIGHT / 20.58,
                      width: (_currentPage == (_pages.length - 1)) ? 125 : 125,
                      decoration: BoxDecoration(
                        color: ColorUtils.colorAppDefaultBlue,
                        boxShadow: [
                          BoxShadow(color: Colors.white, spreadRadius: 1),
                        ],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: (_currentPage == (_pages.length - 1))
                          ? Text(
                              "Get Started",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )
                          : Text(
                              "Next",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )),
                ),
                SizedBox(
                  height: ScreenResulationUtils.HEIGHT / 46.3,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void jumpTo() {
    Navigator.of(context).pop();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginActivity()));
  }
}
