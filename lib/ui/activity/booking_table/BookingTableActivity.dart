import 'package:flutter/material.dart';
import 'package:where/network/services/ApiResponse.dart';
import 'package:where/ui/activity/booking_table/BookingTableViewModel.dart';
import 'package:where/ui/activity/booking_table/image_slider/ImageSlider.dart';
import 'package:where/ui/activity/booking_table/image_slider/ImageSliderEmpty.dart';
import 'package:where/ui/activity/booking_table/item_open_close/ItemOpenClose.dart';
import 'package:where/ui/activity/booking_table/item_review/ItemReview.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:where/ui/widget/ColoredSafeArea.dart';
import 'package:where/network/model/booking_table_details_model.dart';
import 'package:where/ui/widget/CurveColorButton.dart';
import 'package:where/ui/widget/CurveEditText.dart';
import 'package:where/ui/widget/CurveMultilineEditText.dart';
import 'package:where/ui/widget/CustomeText.dart';
import 'package:expandable/expandable.dart';
import 'package:where/ui/widget/ExpandCollapse.dart';
import 'package:where/utils/ColorUtils.dart';
import 'package:where/utils/DateTimeUtils.dart';
import 'package:where/utils/StringValueUtils.dart';
import 'dart:math' as math;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

class BookingTableActivity extends StatefulWidget {
  final venueId;

  const BookingTableActivity(this.venueId);

  @override
  _BookingTableState createState() => _BookingTableState();
}

class _BookingTableState extends State<BookingTableActivity> {
  BookingTableDetailsModel model = BookingTableDetailsModel();
  final viewModel = BookingTableViewModel();
  final reviewController = TextEditingController();
  final reviewHeadLineController = TextEditingController();
  final numberOfguestController = TextEditingController();
  final voucherController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? _selectedDay = DateTime.now();
  bool dataLoaded = false;
  bool imageLoaded = false;
  bool openCloseLoaded = false;
  bool reviewLoad = false;
  int index = 0;
  String reviewTitle = StringValueUtils.REVIEWS;
  String buttonTitle = "Book now";
  String date = "";
  int imageSliderInitPosition = 0;

  @override
  void initState() {
    date = DateTimeUtils.date(_selectedDay!);
    viewModel.fetchBookingTableList(widget.venueId);
    viewModel.bookingTableListStream!.listen((event) {
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
                dataLoaded = true;
                model.data!.venue!.venueReviews!.length > 0
                    ? reviewLoad = true
                    : false;
                model.data!.venue!.venueTimes!.length > 0
                    ? openCloseLoaded = true
                    : false;
                model.data!.venue!.venueImages!.length > 0
                    ? imageLoaded = true
                    : false;
              });
              break;
            default:
              dataLoaded = false;
              EasyLoading.showError(event.data!.message!);
              break;
          }

          break;
        case Status.ERROR:
          EasyLoading.dismiss();
          EasyLoading.showError(event.message!);
          break;
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ExpandableTheme(
          data: const ExpandableThemeData(
            iconColor: Colors.white,
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            iconSize: 26,
            iconRotationAngle: math.pi / 2,
            collapseIcon: Icons.keyboard_arrow_down,
            expandIcon: Icons.keyboard_arrow_right_rounded,
            useInkWell: true,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              margin: EdgeInsets.only(left: 7, right: 7),
              child: Column(
                children: [
                  imageLoaded
                      ? ImageSlider(
                          list: model.data!.venue!.venueImages!,
                          index: 0,
                          end: model.data!.venue!.venueImages!.length,
                          left: (count) {
                            setState(() {
                              imageSliderInitPosition = count;
                            });


                          },
                          right: (count) {
                            setState(() {
                              imageSliderInitPosition = count;
                            });

                          },
                          onBackPress: () {
                            if (index == 0) {
                              Navigator.of(context).pop();
                            } else {
                              setState(() {
                                index--;
                                if (index == 1) {
                                  buttonTitle = "Book now";
                                }
                                if (index == 2) {
                                  buttonTitle = "Review details";
                                }
                              });
                            }
                          }, initCount: imageSliderInitPosition,)
                      : ImageSliderEmpty(
                          onBackPress: () {
                            if (index == 0) {
                              Navigator.of(context).pop();
                            } else {
                              setState(() {
                                index--;
                              });
                            }
                          },
                        ),
                  SizedBox(
                    height: 14,
                  ),
                  dataLoaded
                      ? CustomeText(
                          title: model.data!.venue!.venueName.toString(),
                          left: 7,
                          right: 7,
                        )
                      : Container(),
                  SizedBox(
                    height: 5,
                  ),
                  dataLoaded
                      ? CustomeText(
                          title: model.data!.venue!.location.toString(),
                          size: 12,
                          left: 7,
                          right: 7,
                        )
                      : Container(),
                  SizedBox(
                    height: 15,
                  ),
                  Visibility(
                      visible: index == 0 ? true : false, child: index_1()),
                  Visibility(
                      visible: index == 1 ? true : false, child: index_2()),
                  Visibility(
                      visible: index == 2 ? true : false, child: index_3()),
                  Visibility(
                      visible: index == 3 ? true : false, child: index_4()),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      width: double.infinity,
                      child: CurveColorButton(
                          name: buttonTitle,
                          pressAction: () {
                            index < 3
                                ? setState(() {
                                    index++;
                                    if (index == 2) {
                                      buttonTitle = "Review details";
                                    }
                                    if (index == 3) {
                                      buttonTitle =
                                          "Confirm reservation and pay now";
                                    }
                                  })
                                : index;
                          })),
                  SizedBox(
                    height: 15,
                  ),
                  Visibility(
                      visible: index == 3 ? true : false, child: t_and_c())
                  // titleTextField(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget index_1() {
    return Column(
      children: [
        dataLoaded
            ? CustomeText(
                title: "About " + model.data!.venue!.venueName.toString(),
                left: 7,
                right: 7,
              )
            : Container(),
        SizedBox(
          height: 5,
        ),
        dataLoaded
            ? CustomeText(
                title: model.data!.venue!.description.toString(),
                size: 12.5,
                left: 7,
                right: 7,
              )
            : Container(),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Flexible(
              flex: 2,
              child: Column(children: [
                CustomeText(
                  title: "Special Conditions",
                  left: 7,
                  right: 2,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(children: [
                  CustomeText(
                    title: "Dress Code:",
                    size: 12.5,
                    left: 7,
                    right: 3,
                  ),
                  CustomeText(
                    title: "Casual ",
                    size: 12.5,
                    right: 2,
                    left: 0,
                  )
                ])
              ]),
            ),
            Flexible(
              flex: 1,
              child: Column(children: [
                CustomeText(
                  title: "Table Name",
                  left: 2,
                  right: 7,
                ),
                SizedBox(
                  height: 5,
                ),
                CustomeText(
                  title: "Anean Place ",
                  size: 12.5,
                  right: 7,
                  left: 2,
                )
              ]),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        expandList(),
        SizedBox(
          height: 15,
        ),
        CustomeText(
          title: "Open and Closing Time",
          left: 7,
          right: 7,
        ),
        SizedBox(
          height: 5,
        ),
        openCloseLoaded ? buildOpenCloseList() : Container(),
      ],
    );
  }

  Widget index_2() {
    return Container(
      child: Column(
        children: [
          CustomeText(
            title: "Book a Table",
            alingment: Alignment.center,
            size: 15.5,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: TableCalendar(
              calendarStyle: CalendarStyle(
                defaultTextStyle: TextStyle(color: Colors.black),
                todayDecoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.rectangle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                headerPadding: EdgeInsets.symmetric(vertical: 0.0),
                headerMargin: EdgeInsets.only(bottom: 10),
                formatButtonShowsNext: false,
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600),
                leftChevronIcon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 24,
                ),
                rightChevronIcon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 24,
                ),
                decoration: BoxDecoration(
                  color: ColorUtils.colorAppDefaultBlue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                ),
              ),
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _selectedDay!,
              availableGestures: AvailableGestures.none,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay;
                    date = DateTimeUtils.date(_selectedDay!);
                  });
                }
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          CurveEditText(
            hints: "Number of guests",
            transparent: false,
            controller: numberOfguestController,
            style: Icon(
              Icons.people_outline,
              color: Colors.white,
            ),
            type: TextInputType.number,
            font_size: 14.5,
          ),
          SizedBox(
            height: 15,
          ),
          CurveEditText(
            hints: "Voucher code (optional)",
            transparent: false,
            controller: voucherController,
            style: Icon(
              Icons.local_offer_outlined,
              color: Colors.white,
            ),
            font_size: 14.5,
          ),
        ],
      ),
    );
  }

  Widget index_3() {
    return Container(
      child: Column(
        children: [
          CustomeText(
            title: "Book a Table",
            alingment: Alignment.center,
          ),
          SizedBox(
            height: 15,
          ),
          CurveEditText(
            hints: "Name",
            transparent: false,
            controller: nameController,
          ),
          SizedBox(
            height: 10,
          ),
          CurveEditText(
            hints: "phone no",
            transparent: false,
            controller: phoneController,
            type: TextInputType.phone,
          ),
          SizedBox(
            height: 10,
          ),
          CurveEditText(
            hints: "Email",
            transparent: false,
            controller: emailController,
          )
        ],
      ),
    );
  }

  Widget index_4() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          CustomeText(
            title: "Reservation Details",
            alingment: Alignment.center,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Flexible(
                  flex: 4,
                  child: reservationDetailItem(
                    "Date",
                    date,
                    ColorUtils.colorAppDefaultBlue,
                    Icons.calendar_today_outlined,
                  )),
              Flexible(
                  flex: 3,
                  child: reservationDetailItem(
                      "Total Guests",
                      numberOfguestController.text,
                      Colors.white,
                      Icons.people_outline)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Flexible(
                  flex: 4,
                  child: reservationDetailItem("Email", emailController.text,
                      Colors.white, Icons.email_outlined)),
              Flexible(
                  flex: 3,
                  child: reservationDetailItem("Name", nameController.text,
                      ColorUtils.colorAppDefaultBlue, Icons.person_outline)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Flexible(
                  flex: 4,
                  child: reservationDetailItem("Where ID", "",
                      ColorUtils.colorAppDefaultBlue, Icons.message)),
              Flexible(
                  flex: 3,
                  child: reservationDetailItem("Phone no", phoneController.text,
                      Colors.white, Icons.phone_android_rounded)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          reservationDetailItem("Total Bill", "", Colors.white, Icons.money),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget t_and_c() {
    return Column(children: [
      CustomeText(title: "Term & Conditions"),
      SizedBox(
        height: 10,
      ),
      CustomeText(
        title:
            "1. Please arrive on time as your reservation is only guranteed for 20 minutes after the time of the reservation.",
        colors: Colors.white54,
        justify: TextAlign.justify,
        size: 12,
      ),
      SizedBox(
        height: 8,
      ),
      CustomeText(
        title:
            "2. The discount is applied on all food items but does not include drinks.(otherwise specified in the restaurant special conditions section)",
        colors: Colors.white54,
        justify: TextAlign.justify,
        size: 12,
      ),
      SizedBox(
        height: 8,
      ),
      CustomeText(
        title:
            "3. Please arrive on time as your reservation is only guranteed for 20 minutes after the time of the reservation.",
        colors: Colors.white54,
        justify: TextAlign.justify,
        size: 12,
      ),
      SizedBox(
        height: 8,
      ),
      CustomeText(
        title:
            "4. The discount is applied on all food items but does not include drinks.(otherwise specified in the restaurant special conditions section)",
        colors: Colors.white54,
        justify: TextAlign.justify,
        size: 12,
      ),
      SizedBox(
        height: 8,
      ),
      CustomeText(
        title:
            "5. Please arrive on time as your reservation is only guranteed for 20 minutes after the time of the reservation.",
        colors: Colors.white54,
        justify: TextAlign.justify,
        size: 12,
      ),
      SizedBox(
        height: 8,
      ),
      Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 4, right: 4),
        child: RichText(
          text: TextSpan(children: [
            new TextSpan(
                text: "6. For help,email us at ",
                style: TextStyle(color: Colors.white54, fontSize: 12)),
            new TextSpan(
                text: "help@where.com ",
                style: TextStyle(
                    color: ColorUtils.colorAppDefaultBlue, fontSize: 12)),
            new TextSpan(
                text: "or call us at ",
                style: TextStyle(color: Colors.white54, fontSize: 12)),
            new TextSpan(
                text: "+97150 6727176",
                style: TextStyle(
                    color: ColorUtils.colorAppDefaultBlue, fontSize: 12)),
          ]),
        ),
      ),
      SizedBox(
        height: 10,
      ),
    ]);
  }

  Widget reservationDetailItem(
      String title, String des, final colors, final icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: colors,
          size: 15,
        ),
        SizedBox(
          width: 7,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomeText(
              title: title,
              size: 12.2,
            ),
            SizedBox(
              height: 3,
            ),
            CustomeText(
              title: des,
              size: 13.6,
            ),
          ],
        )
      ],
    );
  }

  Widget buildOpenCloseList() {
    return Container(
      margin: EdgeInsets.only(left: 7, right: 7),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: model.data!.venue!.venueTimes!.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: ItemOpenClose(
              weekName:
                  model.data!.venue!.venueTimes![index].dayName.toString(),
              time: model.data!.venue!.venueTimes![index].openTime.toString() +
                  " - " +
                  model.data!.venue!.venueTimes![index].closeTime.toString(),
            ),
          );
        },
      ),
    );
  }

  Widget expandList() {
    return Container(
      margin: EdgeInsets.only(left: 7, right: 7),
      child: ListView(
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          ExpandCollapse(
              title: reviewTitle,
              fontSize: 14.5,
              left: 0,
              right: 0,
              expand: reviewList(),
              collapse: Container())
        ],
      ),
    );
  }

  Widget reviewList() {
    return Column(
      children: [
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: reviewLoad ? model.data!.venue!.venueReviews!.length : 0,
          itemBuilder: (_, index) {
            return reviewLoad
                ? ItemReview(
                    title: model.data!.venue!.venueReviews![index].title
                        .toString(),
                    review: model.data!.venue!.venueReviews![index].review
                        .toString(),
                    name: model.data!.venue!.venueReviews![index].memberName
                        .toString(),
                    date: model.data!.venue!.venueReviews![index].createAt!
                        .toInt(),
                  )
                : Container();
          },
        ),
        SizedBox(
          height: 15,
        ),
        CurveColorButton(name: "Expand more review", pressAction: () {}),
        SizedBox(
          height: 15,
        ),
        CustomeText(title: "Add a Written Review"),
        SizedBox(
          height: 5,
        ),
        CurveMultilineEditText(
            hints: "Tell us what you like or dislike about this product",
            controller: reviewController),
        SizedBox(
          height: 15,
        ),
        CustomeText(title: "Add Title"),
        SizedBox(
          height: 4,
        ),
        CustomeText(
          title: "Sum up your review in the line",
          size: 12,
        ),
        SizedBox(
          height: 5,
        ),
        CurveEditText(
            hints: "Headline for your review",
            transparent: false,
            controller: reviewHeadLineController),
        SizedBox(
          height: 5,
        ),
        Container(
            alignment: Alignment.centerLeft,
            child: CurveColorButton(
                name: StringValueUtils.SUBMIT, pressAction: () {}))
      ],
    );
  }
}
