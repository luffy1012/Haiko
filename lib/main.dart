import 'package:flutter/material.dart';
import 'package:metro_prototype/pages/homePage.dart';

import 'package:metro_prototype/pages/loginPage.dart';
import 'package:metro_prototype/pages/registerPage.dart';
import 'package:metro_prototype/uiConstsants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: color1,
        cursorColor: color1,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: Colors.white,
      ),
      initialRoute: LoginPage.routeName,
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        RegisterPage.routeName: (context) => RegisterPage(),
        HomePage.routeName: (context) => HomePage(),
      },
    );
  }
}
