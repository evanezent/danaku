import 'package:danaku/constant/constants.dart';
import 'package:danaku/models/user.dart';
import 'package:danaku/ui/pages/dashboard_page.dart';
import 'package:danaku/ui/widgets/button_primary.dart';
import 'package:danaku/ui/widgets/first_form_header.dart';
import 'package:danaku/utils/helper.dart';
import 'package:flutter/material.dart';

class FormUser extends StatefulWidget {
  @override
  _FormUserState createState() => _FormUserState();
}

class _FormUserState extends State<FormUser> {
  bool _autoValidate = false;
  bool _isTrueBigger = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController textName = new TextEditingController();
  TextEditingController textIncome = new TextEditingController();
  TextEditingController textSaving = new TextEditingController();

  // Initializing Database
  DatabaseHelper dbHelper = DatabaseHelper();
  User userData;

  void register() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print("form validate");

      userData.setName = textName.text;
      userData.setIncome = double.parse(textIncome.text);
      userData.setSaving = double.parse(textSaving.text);

      int result = await dbHelper.insertDB(userData);

      result != 0
          ? _showAlertDialog("Success", "Data successfully added !")
          : _showAlertDialog("Failed", "Error while add data !");

      // if INCOME IS LESS THAN SAVING
      if (int.parse(textSaving.text) >= int.parse(textIncome.text)) {
        setState(() {
          _isTrueBigger = false;
        });
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
      }
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colorPrimary,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              FirstFormHeader(size: size),
              SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: _formKey,
                  autovalidate: _autoValidate,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: darkShadow,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          controller: textName,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value.isEmpty || value.length <= 0) {
                              return 'Field empty !';
                            } else if (value.length < 3) {
                              return 'Field should be more than 3 charater';
                            } else if (value.length >= 15) {
                              return 'Field should be less than 15 charater';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              hintText: "Nickname",
                              labelText: "Nickname",
                              hintStyle: TextStyle(
                                color: colorPrimary,
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: darkShadow,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          controller: textIncome,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value.isEmpty || value.length <= 0) {
                              return 'Field empty !';
                            } else if (int.parse(value) <= 0) {
                              return 'Value cannot be zero';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              hintText: "Income",
                              labelText: "Income",
                              hintStyle: TextStyle(
                                color: colorPrimary,
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: darkShadow,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          controller: textSaving,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value.isEmpty || value.length <= 0) {
                              return 'Field empty !';
                            } else if (int.parse(value) <= 0) {
                              return 'Value cannot be zero';
                            } else {
                              print("KOSONG");
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              hintText: "Saving",
                              labelText: "Saving",
                              hintStyle: TextStyle(
                                color: colorPrimary,
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
              ButtonPrimary(
                text: "Submit",
                onClick: () {
                  register();
                },
              ),
              Text(
                _isTrueBigger ? "" : "Income is less than saving",
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }
}
