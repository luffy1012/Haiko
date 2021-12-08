import 'package:flutter/material.dart';
import 'package:metro_prototype/pages/bookingTile.dart';
import 'package:metro_prototype/sharedPrefHandler.dart';

class HistoryTab extends StatefulWidget {
  @override
  _HistoryTabState createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  List<Map> bookings;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPrefHandler.getSp(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          bookings = snapshot.data;
          // print(bookings);
          bookings.sort((a, b) {
            DateTime date1 = DateTime.parse(a['date']);
            DateTime date2 = DateTime.parse(b['date']);
            return date1.compareTo(date2);
          });
          // print(bookings);
          return ListView(
              children: bookings
                  .map((e) => Card(
                        child: BookingTile(e),
                      ))
                  .toList());
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
