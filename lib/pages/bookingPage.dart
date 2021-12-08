import 'dart:ui';
import 'package:intl/intl.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metro_prototype/uiConstsants.dart';

class BookingPage extends StatelessWidget {
  final Map bookings;
  BookingPage(this.bookings);
  final _dateFormatter = DateFormat('d MMMM');
  final _yearFormatter = DateFormat('y');
  final _dayFormatter = DateFormat('EEEE');
  DateTime date, today;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    date = DateTime.parse(bookings['date']);
    today = DateTime.now();
    int diffDay = DateTime(date.year, date.month, date.day)
        .difference(DateTime(today.year, today.month, today.day))
        .inDays;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    color1,
                    Color.fromRGBO(41, 158, 231, 1),
                    Color.fromRGBO(96, 189, 247, 1)
                  ]),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70, bottom: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.asset('images/qrcode.png'),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Token : ${bookings['tokenid']}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 4),
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 20),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "Welcome To",
                              style: TextStyle(
                                  color: color2,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: color1)),
                              child: Hero(
                                tag: 'logo',
                                child: ClipOval(
                                  child: Image.asset(
                                    'images/haiko1.jpg',
                                    height: width / 3.5,
                                    width: width / 3.5,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      Container(
                        child: (diffDay < 0)
                            ? getContainer(
                                "Expired", Icons.timer_off_outlined, Colors.red)
                            : ((diffDay == 0)
                                ? getContainer(
                                    "Active", Icons.check, Colors.green)
                                : getContainer("Soon will be activated",
                                    Icons.check, Colors.blue)),
                      ),
                      SizedBox(height: 40),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "Date : ${_dateFormatter.format(DateTime.parse(bookings['date']))}, "
                              "${_yearFormatter.format(DateTime.parse(bookings['date']))}",
                              style: TextStyle(
                                color: color2,
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              "Time Slot : ${bookings['slot']}",
                              style: TextStyle(
                                color: color2,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget getContainer(String text, IconData iconData, Color color) {
    return Container(
      // color: Colors.red,
      child: Column(
        children: [
          Text(
            "Status:",
            style: TextStyle(
                color: color1, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: color,
                size: 30,
              ),
              Text(
                text,
                style: TextStyle(
                    color: color, fontWeight: FontWeight.bold, fontSize: 26),
              )
            ],
          ),
        ],
      ),
    );
  }
}
