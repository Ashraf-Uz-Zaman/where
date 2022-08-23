import 'package:intl/intl.dart';

class DateTimeUtils{
 static String dateTimestamp(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp );

    return DateFormat('dd MMM,yyyy').format(date).toString();
  }

 static String date(DateTime date) {

   return DateFormat('dd MMM,yyyy').format(date).toString();
 }
}