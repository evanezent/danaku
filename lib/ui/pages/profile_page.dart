import 'package:danaku/constant/constants.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController textNickname = new TextEditingController();
  TextEditingController textIncome = new TextEditingController();
  TextEditingController textSaving = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colorPrimary,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: size.width * 0.3),
            width: size.width * 0.85,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Profile",
                    style: TextStyle(
                      color: colorSecondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Text(
                        "What should we call you ?",
                        style: TextStyle(
                            color: colorSecondary,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: colorSecondary),
                          color: Colors.white,
                          boxShadow: darkShadow,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        controller: textNickname,
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
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                            hintText: "nickname",
                            labelText: "nickname",
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
                        "Your Income for a Month",
                        style: TextStyle(
                            color: colorSecondary,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: colorSecondary),
                          color: Colors.white,
                          boxShadow: darkShadow,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        controller: textIncome,
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
                            hintText: "income",
                            labelText: "income",
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
                        "Your Saving for a Month",
                        style: TextStyle(
                            color: colorSecondary,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: colorSecondary),
                          color: Colors.white,
                          boxShadow: darkShadow,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        controller: textSaving,
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
                            hintText: "saving",
                            labelText: "saving",
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
                  ],
                )),
                SizedBox(height: 40),
                Center(
                  child: RaisedButton(
                    onPressed: () {},
                    color: colorSecondary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Container(
                      width: size.width * 0.7,
                      child: Center(
                        child: Text(
                          "Update",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      FocusScope.of(context).unfocus();
                    },
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Container(
                      width: size.width * 0.7,
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              color: colorSecondary, fontWeight: FontWeight.w600),
                        ),
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
