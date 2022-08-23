import 'package:flutter/material.dart';
import 'package:where/ui/widget/ColoredSafeArea.dart';
import 'package:where/utils/ResponsiveUtils.dart';
import 'package:where/utils/StringValueUtils.dart';
import 'package:auto_size_text/auto_size_text.dart';

class MyBookingActivity extends StatefulWidget {
  @override
  _MyBookingState createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBookingActivity> {
  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(StringValueUtils.MY_BOOKING,style: TextStyle(fontSize: 20,color: Colors.white),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 4,
            ),
            myBookedTablesTextField(),
            SizedBox(
              height: 12,
            ),
            buildMyBookedTablesListView(),
            SizedBox(
              height: 18,
            ),
            walksInsTextField(),
            SizedBox(
              height: 12,
            ),
            buildwalksInsListView(),
            SizedBox(
              height: 18,
            ),
            myCartTextField(),
            SizedBox(
              height: 12,
            ),
            buildMyCartListView(),
          ],
        ),
      ),
    ));
  }

  Widget myBookedTablesTextField() {
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

  Widget buildMyBookedTablesListView() {
    return Container(
        margin: EdgeInsets.only(left: 4, right: 14),
        child: SizedBox(
          height: 86,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (_, index) {
              return myBookedTablesCard();
            },
          ),
        ));
  }

  Widget myBookedTablesCard() {
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

  Widget walksInsTextField() {
    return Container(
        margin: EdgeInsets.only(top: 10, left: 14),
        alignment: Alignment.topLeft,
        child: Text(
          StringValueUtils.WALK_INS,
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ));
  }

  Widget buildwalksInsListView() {
    return Container(
      margin: EdgeInsets.only(left: 4, right: 14),
      child: SizedBox(
        height: 86,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (_, index) {
            return walksInsTablesCard();
          },
        ),
      ),
    );
  }

  Widget walksInsTablesCard() {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child:  ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                "images/m2.jpg",
                fit: BoxFit.cover,
                height: 86,
                width: 130,
              )),
    );
  }

  Widget myCartTextField() {
    return Container(
        margin: EdgeInsets.only(
            top: 10,
            left: 14),
        alignment: Alignment.topLeft,
        child: Text(
          StringValueUtils.MY_CART,
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ));
  }

  Widget buildMyCartListView() {
    return Container(
      margin: EdgeInsets.only(left: 4, right: 14),
      child: SizedBox(
        height: 86,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (_, index) {
            return myCartTablesCard();
          },
        ),
      ),
    );
  }

  Widget myCartTablesCard() {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child:  ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                "images/w2.jpg",
                fit: BoxFit.cover,
                height: 86,
                width: 130,
              ),),
    );
  }
}
