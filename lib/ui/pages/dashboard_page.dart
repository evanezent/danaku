import 'package:danaku/constant/constants.dart';
import 'package:danaku/ui/pages/profile_page.dart';
import 'package:danaku/ui/pages/report_list_page.dart';
import 'package:danaku/ui/widgets/dashboard_header.dart';
import 'package:danaku/ui/widgets/form_outcome.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    // 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colorPrimary,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 20),
            DashboardHeader(),
            SizedBox(height: size.height * 0.12),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: navShadow),
                      child: Icon(
                        Icons.person_pin,
                        color: colorSecondary,
                        size: 50,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReportList()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: navShadow),
                      child: Icon(
                        Icons.list_sharp,
                        color: colorSecondary,
                        size: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: FormOutcoume("Add", () {}, size.width)),
          ],
        ),
      ),
    );
  }
}
