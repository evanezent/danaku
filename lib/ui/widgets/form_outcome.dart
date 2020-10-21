import 'package:danaku/constant/constants.dart';
import 'package:flutter/material.dart';

Widget FormOutcoume(String buttonText, Function onClick, double size) {
  var _formKey = GlobalKey<FormState>();

  TextEditingController textItem = new TextEditingController();
  TextEditingController textPrice = new TextEditingController();

  return Container(
    margin: EdgeInsets.only(top: 50),
    padding: EdgeInsets.all(14),
    width: size,
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
              autofocus: false,
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
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
              autofocus: false,
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
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.white,
              onPressed: onClick,
              child: Text(
                buttonText,
                style: TextStyle(
                    color: colorSecondary, fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
