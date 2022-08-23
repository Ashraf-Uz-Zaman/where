import 'package:flutter/material.dart';
import 'package:where/ui/widget/ColoredSafeArea.dart';
import 'package:where/utils/ColorUtils.dart';
import 'package:where/utils/ResponsiveUtils.dart';
import 'package:where/utils/StringValueUtils.dart';

import 'item_message/ItemMessage.dart';

class MessageActivity extends StatefulWidget {
  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<MessageActivity> {

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(StringValueUtils.MESSAGE,style: TextStyle(fontSize: 20,color: Colors.white),),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Column(
          children: [
            searchField(),
            itemMessage()
          ],

        ),
      ),);
  }

  Widget searchField() {
    return Container(
      margin: EdgeInsets.only(
        top: ResponsiveUtils.marginTop(6),
        left: ResponsiveUtils.marginLeft(35),
        right: ResponsiveUtils.marginRight(35),
      ),
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(
          top: ResponsiveUtils.marginTop(16),
          left: ResponsiveUtils.marginLeft(12),
          right: ResponsiveUtils.marginRight(12),
        ),
        alignment: Alignment.topCenter,
        child: TextFormField(
          keyboardType: TextInputType.text,
          autofocus: false,
          obscureText: false,
          cursorColor: Colors.white,
          style: TextStyle(fontSize: 15.0, color: Colors.white),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
                top: ResponsiveUtils.marginTop(10),
                bottom: ResponsiveUtils.marginBottom(10),
                left: ResponsiveUtils.marginLeft(48),
                right: ResponsiveUtils.marginRight(48)),
            filled: true,
            fillColor: ColorUtils.colorTanspatentBlack62,
            hintText: StringValueUtils.SEARCH_MESSAGE,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            hintStyle: TextStyle(fontSize: 15.0, color: Colors.white70),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),


    );
  }

  Widget itemMessage() {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: <Widget>[

        Container(
          height: 300,
          margin: EdgeInsets.only(left: 12,right: 12,top: 6),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[

              ItemMessage(true, img: "images/m1.jpg", online: true,name: "Ashraf",sur_name: "@acid ",location: "Jumerah Lake Town",),
              Divider(
                color: Colors.grey,
                endIndent: 15,
                indent: 125,
              ),
              ItemMessage(false, img: "images/m2.jpg", online: false,name: "Ashraf",sur_name: "@acid ",location: "Jumerah Lake Town",),
              Divider(
                color: Colors.grey,
                endIndent: 15,
                indent: 125,
              )
            ],
          ),
        )
      ],
    );
  }
}