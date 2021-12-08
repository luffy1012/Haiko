import 'dart:async';
import 'dart:ui';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:metro_prototype/sharedPrefHandler.dart';
import 'package:metro_prototype/uiConstsants.dart';

class BookingTab extends StatefulWidget {
  @override
  _BookingTabState createState() => _BookingTabState();
}

class _BookingTabState extends State<BookingTab> {
  DateTime now = DateTime.now();
  final _dateFormatter = DateFormat('d MMMM');
  final _dateFormatter2 = DateFormat('d MMM');

  final _yearFormatter = DateFormat('y');
  final _dayFormatter = DateFormat('E');

  String selectedDate, selectedSlot;
  List<Map> bookings;
  Map singleBooking;
  bool checkDate, checkSlot;

  final List<DateTime> dates = List<DateTime>();
  List<String> timeSlots = [
    '09:00 AM',
    '09:30 AM',
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
    '12:00 PM',
    '12:30 PM',
    '01:00 PM',
    '01:30 PM',
    '02:00 PM',
    '02:30 PM',
    '03:00 PM',
    '03:30 PM',
    '04:00 PM',
    '04:30 PM',
    '05:00 PM',
    '05:30 PM',
    '06:00 PM',
    '06:30 PM',
    '07:00 PM',
    '07:30 PM',
    '08:00 PM',
    '08:30 PM',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DateTime date = DateTime(now.year, now.month, now.day);
    for (int i = 0; i <= 5; i++) {
      dates.add(date.add(Duration(days: i)));
    }
    // print(dates);
    selectedSlot = timeSlots[0];
    selectedDate = dates[0].toString();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                height: 60,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dates.length,
                    itemBuilder: (context, index) {
                      /*print(dates[index]);
                            bool checkDate = bookings.any((element) =>
                                element.containsValue(dates[index].toString()));
                            print(checkDate);*/
                      checkDate = (selectedDate == dates[index].toString());
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: checkDate ? color3 : Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(1.0, 1.0))
                            ],
                          ),
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                selectedDate = dates[index].toString();
                              });
                            },
                            highlightColor: color1,
                            splashColor: Colors.blue[200],
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${_dayFormatter.format(dates[index])}, ${_dateFormatter2.format(dates[index])} ${_yearFormatter.format(dates[index])}",
                                    style:
                                        TextStyle(fontSize: 15, color: color2),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 8.0, left: 8, right: 8, top: 8),
              child: Container(
                child: Center(
                  child: Text(
                    "${_dateFormatter.format(DateTime.parse(selectedDate)).toString()}, $selectedSlot",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: color2),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 2,
              color: color1.withOpacity(0.4),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  childAspectRatio: (4 / 2),
                  crossAxisCount: 4,
                  children: timeSlots.map((e) {
                    /*checkSlot = bookings.any((element) =>
                              element.containsValue(selectedDate) &&
                              element.containsValue(e));*/
                    return Padding(
                      padding:
                          const EdgeInsets.only(bottom: 8.0, left: 8, right: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: (selectedSlot == e) ? color3 : Colors.white,
                            border: Border.all(color: color1)),
                        child: FlatButton(
                          highlightColor: color1,
                          splashColor: color3,
                          onPressed: () {
                            setState(() {
                              selectedSlot = e.toString();
                              //print(selectedSlot);
                            });
                          },
                          child: Text(
                            e.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: color2),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Divider(
              thickness: 2,
              color: color1.withOpacity(0.4),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8, left: 8.0, right: 8.0, bottom: 8),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextFormField(
                        initialValue: 'Anil Rai',
                        decoration: textfield2Deco.copyWith(
                          prefixIcon: Icon(Icons.account_circle),
                          hintText: "Enter your name",
                          labelText: "Name",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextFormField(
                        initialValue: 'anilrai@gmail.com',
                        decoration: textfield2Deco.copyWith(
                          prefixIcon: Icon(Icons.alternate_email_outlined),
                          hintText: "Enter your email",
                          labelText: "Email",
                        ),
                      ),
                    ),
                    TextFormField(
                      initialValue: '9999999999',
                      decoration: textfield2Deco.copyWith(
                        prefixIcon: Icon(Icons.phone),
                        hintText: "Enter your mobile number",
                        labelText: "Mobile Number",
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8.0, left: 8, right: 8),
                child: RaisedButton.icon(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: color3)),
                  icon: Icon(
                    Icons.book_online_outlined,
                    color: Colors.white,
                  ),
                  label: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                    child: Text("Book a Slot",
                        style: TextStyle(color: Colors.white)),
                  ),
                  color: color1,
                  onPressed: () {
                    showDialog(
                      context: context,
                      child: AlertDialog(
                        title: Text("Confirm booking?"),
                        content: Text(
                            "You selected booking on ${_dateFormatter.format(DateTime.parse(selectedDate))} at $selectedSlot"),
                        actions: [
                          FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Cancel")),
                          FlatButton(
                              onPressed: () {
                                Random random = new Random();
                                int randomNumber = random.nextInt(999);
                                Map val = Map();
                                val['tokenid'] = randomNumber;
                                val['date'] = selectedDate.toString();
                                val['slot'] = selectedSlot;

                                SharedPrefHandler.addSP(val);
                                // print(SharedPrefHandler.getSp());
                                Navigator.pop(context);
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return SimpleDialog(
                                      title: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(20),
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    width: 2, color: color1)),
                                            child: Icon(
                                              Icons.check,
                                              color: color1,
                                              size: 40,
                                            ),
                                          ),
                                          Text(
                                            "Booking Confirmed",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: color1, fontSize: 20),
                                          ),
                                          SizedBox(height: 20),
                                          RaisedButton(
                                            child: Text(
                                              "Done",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            color: color1,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                                side:
                                                    BorderSide(color: color3)),
                                          ),
                                          SizedBox(height: 20),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Text("Confirm")),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
/* List<String> timeSlots = [
    '9:00 AM - 9:30 AM',
    '9:30 AM - 10:00 AM',
    '10:00 AM - 10:30 AM',
    '10:30 AM - 11:00 AM',
    '11:00 AM - 11:30 AM',
    '11:30 AM - 12:00 PM',
    '12:00 PM - 12:30 PM',
    '12:30 PM - 01:00 PM',
    '01:00 PM - 01:30 PM',
    '01:30 PM - 02:00 PM',
    '02:00 PM - 02:30 PM',
    '02:30 PM - 03:00 PM',
    '03:00 PM - 03:30 PM',
    '03:30 PM - 04:00 PM',
    '04:00 PM - 04:30 PM',
    '04:30 PM - 05:00 PM',
    '05:00 PM - 05:30 PM',
    '05:30 PM - 06:00 PM',
    '06:00 PM - 06:30 PM',
    '06:30 PM - 07:00 PM',
    '07:00 PM - 07:30 PM',
    '07:30 PM - 08:00 PM',
    '08:00 PM - 08:30 PM',
    '08:30 PM - 09:00 PM',
  ];*/
