import 'package:danaku/constant/constants.dart';
import 'package:flutter/material.dart';

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
