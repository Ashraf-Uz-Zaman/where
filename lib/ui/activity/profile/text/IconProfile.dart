import 'package:flutter/material.dart';
import 'package:where/utils/ColorUtils.dart';

class IconProfile extends StatelessWidget {
  final String title;
  final String? error;
  final String value;
  final onTap;
  final bool edit;

  const IconProfile(
      {Key? key,
      required this.title,
      this.error, required this.edit,
      this.onTap,required this.value,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Divider(
            thickness: 1,
            color: Colors.grey.shade600,
          ),
        SizedBox(height: 7),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title + ":",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
              maxLines: 1,
            ),
            SizedBox(
              width: 5,
            ),

            Icon(getIcon(),color: Colors.white,),

            Spacer(),
            InkWell(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: Text(edit ? "Done" : "Edit",
                    style: TextStyle(
                        fontSize: 13,
                        color: ColorUtils.colorAppDefaultBlue,
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ],
    );
  }
  dynamic getIcon(){
    var icon = Icons.male;
    switch(value){
      case "Female":
        icon = Icons.female;
        break;
      case "Other":
        icon = Icons.transgender;
        break;
      default:
        icon = Icons.male;
        break;
    }
    return icon;
  }
}
