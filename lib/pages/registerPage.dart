import 'package:flutter/material.dart';
import 'package:metro_prototype/pages/loginPage.dart';

import '../uiConstsants.dart';

class RegisterPage extends StatefulWidget {
  static final String routeName = "/registerPage";

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    // FocusScope.of(context).unfocus();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: color1, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            height: MediaQuery.of(context).size.height,

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
                    padding: const EdgeInsets.only(
                        left: 100, right: 100, bottom: 30),
                    child: ClipOval(
                      child: Image.asset(
                        'images/haiko1.jpg',
                        height: width / 3,
                        width: width / 3,
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
                            keyboardType: TextInputType.name,
                            decoration: textfield1Deco.copyWith(
                              prefixIcon: Icon(Icons.account_circle),
                              hintText: "Enter your name",
                              labelText: "Name",
                            ),
                          ),
                          SizedBox(height: 30),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: textfield1Deco.copyWith(
                                prefixIcon: Icon(Icons.phone),
                                hintText: "Enter your mobile number",
                                labelText: "Mobile Number"),
                          ),
                          SizedBox(height: 30),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: textfield1Deco.copyWith(
                              prefixIcon: Icon(Icons.alternate_email),
                              hintText: "Enter your Email",
                              labelText: "Email",
                            ),
                          ),
                          SizedBox(height: 30),
                          TextFormField(
                            obscureText: true,
                            decoration: textfield1Deco.copyWith(
                              prefixIcon: Icon(Icons.lock),
                              hintText: "Enter your password",
                              labelText: "Password",
                            ),
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              getButton("Register", Icons.person_add, () {
                                Navigator.pop(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          Duration(milliseconds: 2000),
                                      pageBuilder: (_, __, ___) => LoginPage(),
                                    ));
                              })
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
