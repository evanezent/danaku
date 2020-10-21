import 'package:danaku/constant/constants.dart';
import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({
    Key key, this.nickname, this.income, this.saving,
  }) : super(key: key);

  final String nickname;
  final double income;
  final double saving;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 50, left: 20, right: 20),
      padding: EdgeInsets.all(14),
      width: size.width,
      height: 170,
      decoration: BoxDecoration(
          color: colorSecondary,
          borderRadius: BorderRadius.circular(25),
          boxShadow: darkShadow),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          RichText(
            text: TextSpan(
              text: 'Halo ',
              style: TextStyle(color: Colors.white, fontSize: 15),
              children: <TextSpan>[
                TextSpan(
                    text: '$nickname !',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Rp 1500000 / $income",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(height: 10),
          RichText(
            text: TextSpan(
              text: 'Saving target : ',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
              children: <TextSpan>[
                TextSpan(
                    text: 'Rp $saving',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
