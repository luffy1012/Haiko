import 'package:flutter/material.dart';
import 'package:metro_prototype/Tabs/bookingTab.dart';
import 'package:metro_prototype/Tabs/historyTab.dart';

import 'package:metro_prototype/uiConstsants.dart';

class HomePage extends StatefulWidget {
  static final String routeName = "/homePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  void updateTabSelection(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> _widgets = [
    BookingTab(),
    HistoryTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: color1, //change your color here
        ),
        leading: (selectedIndex == 0)
            ? Container()
            : IconButton(
                icon: Icon(Icons.arrow_back_outlined),
                onPressed: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                }),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        title: Hero(
          tag: 'logo',
          child: Padding(
            padding: const EdgeInsets.only(
                top: 130, right: 130, bottom: 130, left: 65),
            child: Container(
              child: Image.asset(
                'images/haiko1.jpg',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: _widgets[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: color1,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.book_online_outlined),
              label: 'New Booking',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
              backgroundColor: Colors.grey),
        ],
      ),
    );
  }
}
