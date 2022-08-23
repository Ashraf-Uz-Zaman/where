import 'package:where/network/ApiUtils.dart';
import 'package:where/network/model/booking_table_details_model.dart';
import 'package:where/network/services/ApiBaseHelper.dart';

class BookingTableRepository{
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<BookingTableDetailsModel> getBookingTableDetails(int id) async {
    final response = await _helper.get(ApiUtils.BOOKING_TABLE_DETAIL_URL+id.toString());
    return BookingTableDetailsModel.fromJson(response);
  }
}