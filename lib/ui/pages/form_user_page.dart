import 'package:danaku/constant/constants.dart';
import 'package:danaku/ui/pages/dashboard_page.dart';
import 'package:danaku/ui/widgets/first_form_header.dart';
import 'package:flutter/material.dart';

class FormUser extends StatefulWidget {
  @override
  _FormUserState createState() => _FormUserState();
}

class _FormUserState extends State<FormUser> {
  bool _autoValidate = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController textName = new TextEditingController();
  TextEditingController textIncome = new TextEditingController();
  TextEditingController textSaving = new TextEditingController();

  void register() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print("form validate");

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorPrimary,
      body: Container(
        child: Column(
          children: [
            FirstFormHeader(size: size),
            SizedBox(height: 100),
            Form(
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
                        if (value.length < 3) {
                          print('is empty');
                          return 'Field should be more than 3 charater';
                        } else if (value.length >= 15) {
                          return 'Field should be less than 15 charater';
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
                        if (int.parse(value) <= 0) {
                          print('is empty');
                          return 'Value cannot be zero';
                        } else if (value.length < 0) {
                          return 'Field empty !';
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
                        if (int.parse(value) <= 0) {
                          print('is empty');
                          return 'Value cannot be zero';
                        } else if (value.length < 0) {
                          return 'Field empty !';
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
            SizedBox(height: 50),
            ButtonPrimary(
              text: "Submit",
              onClick: () {
                register();
              },
            )
          ],
        ),
      ),
    );
  }
}

class ButtonPrimary extends StatelessWidget {
  final Function onClick;
  final String text;

  const ButtonPrimary({Key key, this.onClick, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white,
      onPressed: onClick,
      child: Container(
        width: 330,
        height: 50,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: colorSecondary,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
