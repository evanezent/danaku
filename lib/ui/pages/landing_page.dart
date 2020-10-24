import 'dart:async';
import 'package:danaku/constant/constants.dart';
import 'package:danaku/models/user.dart';
import 'package:danaku/ui/pages/dashboard_page.dart';
import 'package:danaku/ui/pages/form_user_page.dart';
import 'package:danaku/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  DatabaseHelper dbHelper = DatabaseHelper();
  List<User> userList;
  int outcome = 0;
  int count = 0;

  void getInitData() {
    final Future<Database> dbFuture = dbHelper.initDatabase('user.db');
    dbFuture.then((database) {
      Future<List<User>> userListFuture = dbHelper.getAllUser();

      userListFuture.then((userList) {
        setState(() {
          this.userList = userList;
          this.count = userList.length;
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    this.getInitData();
    Timer(
        Duration(seconds: 5),
        () => count == 0
            ? Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => FormUser()))
            : Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Dashboard())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorPrimary,
        body: Stack(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/danaku2.png", scale: 4),
                  Text(
                    "DANAKU",
                    style: TextStyle(
                        color: colorSecondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
