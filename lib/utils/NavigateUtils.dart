import 'package:flutter/material.dart';
import 'package:where/network/model/member_profile_info_model.dart';
import 'package:where/ui/activity/booking_table/BookingTableActivity.dart';
import 'package:where/ui/activity/profile/ProfileEditActivity.dart';

class NavigateUtils {
 static void metarialJumpTo(BuildContext context, final route ){
   Navigator.of(context).push( MaterialPageRoute(builder: (context) => route));
  }

 static void JumpToEditProfile(BuildContext context , MemberProfileInfoModel model){
   if(model.data!=null) {
     Navigator.of(context).push(
         MaterialPageRoute(builder: (context) => ProfileEditActivity(model)));
   }
 }

 static void JumpToBookingTable(BuildContext context , int venueId){
   if(venueId > 0) {
     Navigator.of(context).push(
         MaterialPageRoute(builder: (context) => BookingTableActivity(venueId)));
   }
 }
}
