import 'package:danaku/constant/constants.dart';
import 'package:danaku/ui/widgets/report_item.dart';
import 'package:flutter/material.dart';

class ReportList extends StatefulWidget {
  @override
  _ReportListState createState() => _ReportListState();
}

class _ReportListState extends State<ReportList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colorPrimary,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50, left: 20, right: 20),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
            width: size.width,
            height: size.height * 0.25,
            decoration: BoxDecoration(
                color: colorSecondary,
                borderRadius: BorderRadius.circular(25),
                boxShadow: darkShadow),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Your Report List",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Your Outcome : ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Rp 1.300.000',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            text: 'Your Income : ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Rp 2.000.000',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ],
                          ),
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
                                  text: 'Rp 300.000',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ],
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: [
                            Icon(
                              Icons.delete_forever,
                              color: colorBackup,
                              size: 40,
                            ),
                            Text(
                              "Reset book",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500
                              ),
                              )
                          ],
                        ))
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return ReportItem(
                      size: size,
                      itemName: "AAAAA bda n ljasd kja ",
                      itemPrice: "300000",
                    );
                  })),
        ],
      ),
    );
  }
}
