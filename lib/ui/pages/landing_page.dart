import 'dart:async';

import 'package:danaku/constant/constants.dart';
import 'package:danaku/ui/pages/form_user_page.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => FormUser())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorPrimary,
        body: Stack(
          children: <Widget>[
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wysiwyg, color: colorSecondary, size: 40),
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
