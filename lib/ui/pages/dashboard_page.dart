import 'package:danaku/constant/constants.dart';
import 'package:danaku/ui/widgets/dashboard_header.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController textIncome = new TextEditingController();
  TextEditingController textSaving = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorPrimary,
      body: Container(
        child: Column(
          children: [
            DashboardHeader(),
            SizedBox(height: size.height * 0.2),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: navShadow),
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.list_sharp,
                        color: colorSecondary,
                        size: 70,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: navShadow),
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.person_pin,
                        color: colorSecondary,
                        size: 70,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50, left: 20, right: 20),
              padding: EdgeInsets.all(14),
              width: size.width,
              height: 200,
              decoration: BoxDecoration(
                  color: colorSecondary,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: darkShadow),
              child: Row(
                children: [
                  Container(
                    child: Form(
                      child: Column(
                        children: [Container()],
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.add,
                      color: colorSecondary,
                      size: 40,
                    ),
                    backgroundColor: Colors.white,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
