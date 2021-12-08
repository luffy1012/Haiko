import 'package:flutter/material.dart';

var textfield1Deco = InputDecoration(
  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(32.0),
  ),
);
var textfield2Deco = InputDecoration(
  contentPadding: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
  ),
);
var textStyle1 = TextStyle(fontWeight: FontWeight.bold, color: Colors.black);

Widget getButton(String label, IconData icon, Function onTap) {
  return FlatButton.icon(
    minWidth: 120,
    onPressed: onTap,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: BorderSide(color: color2),
    ),
    icon: Icon(
      icon,
      color: Colors.black,
    ),
    label: Text(
      label,
      style: textStyle1,
    ),
  );
}

Color color1 = Color.fromRGBO(144, 167, 32, 1);
Color color2 = Color.fromRGBO(82, 97, 10, 1);
Color color3 = Color.fromRGBO(237, 255, 145, 1);

double widthContainer = 120;

Container todayContainer = Container(
  width: widthContainer,
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
);
Container futureContainer = Container(
  width: widthContainer,
  // color: Colors.red,
  child: Row(
    children: [
      Icon(Icons.done, color: Colors.blue),
      Text(
        "Active",
        style: TextStyle(color: Colors.blue),
      )
    ],
  ),
);
Container pastContainer = Container(
  width: widthContainer,
  // color: Colors.red,
  child: Row(
    children: [
      Icon(Icons.timer_off_outlined, color: Colors.red),
      Text(
        "Expired",
        style: TextStyle(color: Colors.red),
      )
    ],
  ),
);
