import 'package:danaku/constant/constants.dart';
import 'package:flutter/material.dart';

class ReportItem extends StatelessWidget {
  const ReportItem({
    Key key,
    @required this.size,
    this.itemName,
    this.itemPrice,
  }) : super(key: key);

  final Size size;
  final String itemName;
  final String itemPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 25, right: 25, top: 15),
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            // boxShadow: darkShadow
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        itemName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colorPrimary,
                            fontSize: 15),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "Rp ${itemPrice}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: colorPrimary,
                            fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
              // color: Colors.redAccent[200],
              color: colorBackup,
            )
          ],
        ));
  }
}
