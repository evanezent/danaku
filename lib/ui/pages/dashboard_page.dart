import 'package:danaku/constant/constants.dart';
import 'package:danaku/ui/widgets/dashboard_header.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController textItem = new TextEditingController();
  TextEditingController textPrice = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorPrimary,
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 20),
            DashboardHeader(),
            SizedBox(height: size.height * 0.12),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: navShadow),
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.list_sharp,
                        color: colorSecondary,
                        size: 50,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: navShadow),
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.person_pin,
                        color: colorSecondary,
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              margin: EdgeInsets.only(top: 50, left: 20, right: 20),
              padding: EdgeInsets.all(14),
              width: size.width,
              // height: 200,
              decoration: BoxDecoration(
                  color: colorSecondary,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: darkShadow),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Text(
                        "What item that you buy ?",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: darkShadow,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        controller: textItem,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Field empty !';
                          } else if (value.length < 3) {
                            return 'Field should be more than 3 charater';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            hintText: "Item",
                            labelText: "Item",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Text(
                        "How much the price ?",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: darkShadow,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        controller: textPrice,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Field empty !';
                          } else if (int.parse(value) <= 0) {
                            return 'Value cannot be zero';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            hintText: "Price",
                            labelText: "Price",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: RaisedButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.white,
                        onPressed: () {},
                        child: Text(
                          "Add",
                          style: TextStyle(
                              color: colorSecondary,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
