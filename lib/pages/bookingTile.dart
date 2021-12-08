import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:metro_prototype/pages/bookingPage.dart';
import 'package:metro_prototype/uiConstsants.dart';

class BookingTile extends StatelessWidget {
  final Map bookings;

  BookingTile(this.bookings);
  final _dateFormatter = DateFormat('d MMMM');
  final _yearFormatter = DateFormat('y');
  final _dayFormatter = DateFormat('EEEE');

  DateTime date, today;
  @override
  Widget build(BuildContext context) {
    date = DateTime.parse(bookings['date']);
    today = DateTime.now();
    int diffDay = DateTime(date.year, date.month, date.day)
        .difference(DateTime(today.year, today.month, today.day))
        .inDays;

    // print(diffDay);
    return Slidable(
      child: Container(
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 1200),
                pageBuilder: (_, __, ___) => BookingPage(bookings),
              ),
            );
          },
          title: Text(
            "${_dateFormatter.format(
              DateTime.parse(bookings['date']),
            )}, ${_yearFormatter.format(DateTime.parse(bookings['date']))}",
            style: TextStyle(fontSize: 18),
          ),
          subtitle: Text(
            "${_dayFormatter.format(DateTime.parse(bookings['date']))}, ${bookings['slot']}",
            style: TextStyle(fontSize: 15),
          ),
          trailing: (diffDay < 0)
              ? pastContainer
              : ((diffDay == 0) ? todayContainer : futureContainer),
        ),
      ),
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      actions: [
        IconSlideAction(
          caption: "Open",
          color: color1,
          icon: Icons.open_in_new,
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 1200),
                pageBuilder: (_, __, ___) => BookingPage(bookings),
              ),
            );
          },
        )
      ],
      secondaryActions: [
        IconSlideAction(
          caption: "Delete",
          color: Colors.red,
          icon: Icons.delete,
        )
      ],
    );
  }
}
/*Container(
            width: 100,
            // color: Colors.red,
            child: Row(
              children: [
                Icon(Icons.done, color: Colors.green),
                Text(
                  "Active",
                  style: TextStyle(color: Colors.green),
                )
              ],
            ),
          )*/
