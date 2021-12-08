import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metro_prototype/pages/homePage.dart';
import 'package:metro_prototype/pages/registerPage.dart';
import 'package:metro_prototype/uiConstsants.dart';

class LoginPage extends StatefulWidget {
  static final String routeName = "/loginPage";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var isLoading = false;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            height: height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, color1])),
            //#002D72
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 60, right: 60, bottom: 30),
                    child: ClipOval(
                      child: Image.asset(
                        'images/haiko1.jpg',
                        height: width / 2,
                        width: width / 2,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: textfield1Deco.copyWith(
                                prefixIcon: Icon(Icons.phone),
                                hintText: "Enter you mobile number",
                                labelText: "Mobile Number"),
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 30),
                          TextFormField(
                            decoration: textfield1Deco.copyWith(
                              prefixIcon: Icon(Icons.lock),
                              hintText: "Enter your password",
                              labelText: "Password",
                            ),
                            obscureText: true,
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              getButton("Login", Icons.login, () {
                                /*    Navigator.pushNamed(
                                    context, BookigPage.routeName);*/
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration:
                                        Duration(milliseconds: 1200),
                                    pageBuilder: (_, __, ___) => HomePage(),
                                  ),
                                );
                              }),
                              getButton(
                                "Register",
                                Icons.person_add,
                                () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          Duration(milliseconds: 1200),
                                      pageBuilder: (_, __, ___) =>
                                          RegisterPage(),
                                    ),
                                  );
                                  /*Navigator.pushNamed(
                                    context, RegisterPage.routeName);*/
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
