import 'dart:async';
import 'package:where/network/model/booking_table_details_model.dart';
import 'package:where/network/services/ApiResponse.dart';
import 'package:where/ui/activity/booking_table/BookingTableRepository.dart';

class BookingTableViewModel {
  BookingTableRepository? _bookingTableRepository;

  late StreamController<ApiResponse<BookingTableDetailsModel>>
      _bookingTableListController;

  StreamSink<ApiResponse<BookingTableDetailsModel>>? get bookingTableListSink =>
      _bookingTableListController.sink;

  Stream<ApiResponse<BookingTableDetailsModel>>? get bookingTableListStream =>
      _bookingTableListController.stream;

  BookingTableViewModel() {
    _bookingTableListController =
        StreamController<ApiResponse<BookingTableDetailsModel>>();
    _bookingTableRepository = BookingTableRepository();
  }

  fetchBookingTableList(int id) async {
    bookingTableListSink!.add(ApiResponse.loading('Loading'));
    try {
      BookingTableDetailsModel model =
          await _bookingTableRepository!.getBookingTableDetails(id);
      bookingTableListSink!.add(ApiResponse.completed(model));
    } catch (e) {
      bookingTableListSink!.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _bookingTableListController.close();
  }


}
