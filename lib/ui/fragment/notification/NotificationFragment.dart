import 'package:flutter/material.dart';
import 'package:where/ui/widget/ColoredSafeArea.dart';
import 'package:where/utils/ColorUtils.dart';
import 'package:where/utils/StringValueUtils.dart';
import 'package:auto_size_text/auto_size_text.dart';

class NotificationFragment extends StatefulWidget {
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<NotificationFragment> {
  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              centerTitle: true,
              title: Text(StringValueUtils.NOTIFICATIONS,style: TextStyle(fontSize: 20,color: Colors.white),),
            ),
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  notification(),
                ],
              ),
            )));
  }

  Widget notification() {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10
      ),
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(12),child:Text(

            "Today",
            style: TextStyle(
              fontSize: 15.0,
              color: ColorUtils.colorAppDefaultBlue,
            ),


          ) ,),
          buildNotificationListView(),
        ],
      ),
    );
  }

  ListView buildNotificationListView() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (_, index) {
        return ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      text: 'Lorem ipsum, or lipsum as it is sometimes known'),
                ),
              ),
              Flexible(
                  child: Text(
                "1.30 Pm",
                style: TextStyle(color: Colors.white,fontSize: 14),
              ))
            ],
          ),

          subtitle: Container(
            margin: EdgeInsets.only(top: 10,bottom: 20),
            child:Text(
            "The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.justify,
          ),
          ),

        );
      },
    );
  }
}
