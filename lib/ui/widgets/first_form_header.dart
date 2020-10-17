import 'package:danaku/constant/constants.dart';
import 'package:flutter/material.dart';

class FirstFormHeader extends StatelessWidget {
  const FirstFormHeader({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: size.width,
      height: 200,
      decoration: BoxDecoration(
          color: colorSecondary,
          borderRadius: BorderRadius.circular(25),
          boxShadow: darkShadow),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            "Halo !",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(height: 10),
          Text(
            "Sebelum lanjut, izinkan kita tahu tentang kamu dulu ya",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
          )
        ],
      ),
    );
  }
}
