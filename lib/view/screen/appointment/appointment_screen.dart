import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../baseview/button/custom_button.dart';
import '../success/success_screen.dart';

class AppointmentScreen extends StatefulWidget {
  AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  String selectTime = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_PRIMERY,
      appBar: AppBar(
        backgroundColor: ColorResources.COLOR_PRIMERY,
        automaticallyImplyLeading: false,
        elevation: 1,
        centerTitle: true,
        actionsIconTheme: const IconThemeData(color: ColorResources.WHITE),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Icon(
                Icons.arrow_back,
                color: ColorResources.WHITE,
                size: 24,
              )),
        ),
        title: Text("Appointment",
            textAlign: TextAlign.center,
            maxLines: 1,
            style: montserratMedium.copyWith(
                color: ColorResources.WHITE,
                fontSize: AppConstants.itemWidth * 0.04)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: AppConstants.itemWidth,
              decoration: BoxDecoration(
                  color: ColorResources.WHITE,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppConstants.itemWidth * 0.1),
                      topRight: Radius.circular(AppConstants.itemWidth * 0.1))),
              padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.itemWidth * 0.03),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: AppConstants.itemHeight * 0.02),
                child: Column(
                  children: [
                    // Calendar
                    TableCalendar(
                      firstDay: DateTime.now(),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: DateTime.now(),
                    ),

                    // Available Time
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Expanded(
                        child: Text("Available Time",
                            style: montserratMedium.copyWith(
                              color: ColorResources.BLACK,
                              fontSize: AppConstants.itemWidth * 0.045,
                            )),
                      ),
                    ]),
                    SizedBox(
                      height: AppConstants.itemHeight * 0.01,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectTime = "10.00 AM";
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: selectTime == "10.00 AM"
                                    ? ColorResources.COLOR_PRIMERY
                                    : Color(0xffD9D9D9).withOpacity(0.3),
                                borderRadius: BorderRadius.circular(
                                    AppConstants.itemWidth * 0.03)),
                            padding: EdgeInsets.symmetric(
                                vertical: AppConstants.itemWidth * 0.03),
                            child: Text("10.00 AM",
                                textAlign: TextAlign.center,
                                style: montserratMedium.copyWith(
                                    color: ColorResources.BLACK,
                                    fontSize: AppConstants.itemWidth * 0.035)),
                          ),
                        )),
                        SizedBox(
                          width: AppConstants.itemWidth * 0.03,
                        ),
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectTime = "12.00 PM";
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: selectTime == "12.00 PM"
                                    ? ColorResources.COLOR_PRIMERY
                                    : Color(0xffD9D9D9).withOpacity(0.3),
                                borderRadius: BorderRadius.circular(
                                    AppConstants.itemWidth * 0.03)),
                            padding: EdgeInsets.symmetric(
                                vertical: AppConstants.itemWidth * 0.03),
                            child: Text("12.00 PM",
                                textAlign: TextAlign.center,
                                style: montserratMedium.copyWith(
                                    color: ColorResources.BLACK,
                                    fontSize: AppConstants.itemWidth * 0.035)),
                          ),
                        )),
                        SizedBox(
                          width: AppConstants.itemWidth * 0.03,
                        ),
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectTime = "08.00 AM";
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: selectTime == "08.00 AM"
                                    ? ColorResources.COLOR_PRIMERY
                                    : Color(0xffD9D9D9).withOpacity(0.3),
                                borderRadius: BorderRadius.circular(
                                    AppConstants.itemWidth * 0.03)),
                            padding: EdgeInsets.symmetric(
                                vertical: AppConstants.itemWidth * 0.03),
                            child: Text("08.00 AM",
                                textAlign: TextAlign.center,
                                style: montserratMedium.copyWith(
                                    color: ColorResources.BLACK,
                                    fontSize: AppConstants.itemWidth * 0.035)),
                          ),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: AppConstants.itemHeight * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectTime = "11.00 AM";
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: selectTime == "11.00 AM"
                                    ? ColorResources.COLOR_PRIMERY
                                    : Color(0xffD9D9D9).withOpacity(0.3),
                                borderRadius: BorderRadius.circular(
                                    AppConstants.itemWidth * 0.03)),
                            padding: EdgeInsets.symmetric(
                                vertical: AppConstants.itemWidth * 0.03),
                            child: Text("11.00 AM",
                                textAlign: TextAlign.center,
                                style: montserratMedium.copyWith(
                                    color: selectTime == "11.00 AM"
                                        ? ColorResources.WHITE
                                        : ColorResources.BLACK,
                                    fontSize: AppConstants.itemWidth * 0.035)),
                          ),
                        )),
                        SizedBox(
                          width: AppConstants.itemWidth * 0.03,
                        ),
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectTime = "11.00 PM";
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: selectTime == "11.00 PM"
                                    ? ColorResources.COLOR_PRIMERY
                                    : Color(0xffD9D9D9).withOpacity(0.3),
                                borderRadius: BorderRadius.circular(
                                    AppConstants.itemWidth * 0.03)),
                            padding: EdgeInsets.symmetric(
                                vertical: AppConstants.itemWidth * 0.03),
                            child: Text("11.00 PM",
                                textAlign: TextAlign.center,
                                style: montserratMedium.copyWith(
                                    color: selectTime == "11.00 PM"
                                        ? ColorResources.WHITE
                                        : ColorResources.BLACK,
                                    fontSize: AppConstants.itemWidth * 0.035)),
                          ),
                        )),
                        SizedBox(
                          width: AppConstants.itemWidth * 0.03,
                        ),
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectTime = "01.00 AM";
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: selectTime == "01.00 AM"
                                    ? ColorResources.COLOR_PRIMERY
                                    : Color(0xffD9D9D9).withOpacity(0.3),
                                borderRadius: BorderRadius.circular(
                                    AppConstants.itemWidth * 0.03)),
                            padding: EdgeInsets.symmetric(
                                vertical: AppConstants.itemWidth * 0.03),
                            child: Text("01.00 AM",
                                textAlign: TextAlign.center,
                                style: montserratMedium.copyWith(
                                    color: selectTime == "01.00 AM"
                                        ? ColorResources.WHITE
                                        : ColorResources.BLACK,
                                    fontSize: AppConstants.itemWidth * 0.035)),
                          ),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: AppConstants.itemHeight * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectTime = "03.00 AM";
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: selectTime == "03.00 AM"
                                    ? ColorResources.COLOR_PRIMERY
                                    : Color(0xffD9D9D9).withOpacity(0.3),
                                borderRadius: BorderRadius.circular(
                                    AppConstants.itemWidth * 0.03)),
                            padding: EdgeInsets.symmetric(
                                vertical: AppConstants.itemWidth * 0.03),
                            child: Text("03.00 AM",
                                textAlign: TextAlign.center,
                                style: montserratMedium.copyWith(
                                    color: selectTime == "03.00 AM"
                                        ? ColorResources.WHITE
                                        : ColorResources.BLACK,
                                    fontSize: AppConstants.itemWidth * 0.035)),
                          ),
                        )),
                        SizedBox(
                          width: AppConstants.itemWidth * 0.03,
                        ),
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectTime = "04.00 PM";
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: selectTime == "04.00 PM"
                                    ? ColorResources.COLOR_PRIMERY
                                    : Color(0xffD9D9D9).withOpacity(0.3),
                                borderRadius: BorderRadius.circular(
                                    AppConstants.itemWidth * 0.03)),
                            padding: EdgeInsets.symmetric(
                                vertical: AppConstants.itemWidth * 0.03),
                            child: Text("04.00 PM",
                                textAlign: TextAlign.center,
                                style: montserratMedium.copyWith(
                                    color: selectTime == "04.00 PM"
                                        ? ColorResources.WHITE
                                        : ColorResources.BLACK,
                                    fontSize: AppConstants.itemWidth * 0.035)),
                          ),
                        )),
                        SizedBox(
                          width: AppConstants.itemWidth * 0.03,
                        ),
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectTime = "06.00 AM";
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: selectTime == "06.00 AM"
                                    ? ColorResources.COLOR_PRIMERY
                                    : Color(0xffD9D9D9).withOpacity(0.3),
                                borderRadius: BorderRadius.circular(
                                    AppConstants.itemWidth * 0.03)),
                            padding: EdgeInsets.symmetric(
                                vertical: AppConstants.itemWidth * 0.03),
                            child: Text("06.00 AM",
                                textAlign: TextAlign.center,
                                style: montserratMedium.copyWith(
                                    color: selectTime == "06.00 AM"
                                        ? ColorResources.WHITE
                                        : ColorResources.BLACK,
                                    fontSize: AppConstants.itemWidth * 0.035)),
                          ),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: AppConstants.itemHeight * 0.01,
                    ),
                    GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SuccessScreen(),
                            )),
                        child: const CustomButton("Book an Appointment")),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
