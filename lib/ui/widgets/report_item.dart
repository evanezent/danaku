import 'package:danaku/constant/constants.dart';
import 'package:danaku/ui/widgets/form_outcome.dart';
import 'package:flutter/material.dart';

class ReportItem extends StatelessWidget {
  const ReportItem({
    Key key,
    @required this.size,
    this.itemName,
    this.itemPrice,
    this.delFunction,
    this.itemDate,
  }) : super(key: key);

  final Size size;
  final String itemName;
  final String itemDate;
  final double itemPrice;
  final Function delFunction;

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
                  padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
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
                        itemDate,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[400],
                            fontSize: 12),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Rp ${itemPrice}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: colorPrimary,
                            fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.transparent,
                      content: Container(
                          height: size.height * 0.4,
                          child: FormOutcoume("Update", () {}, size.width)),
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: colorSecondary),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Icon(
                    Icons.edit,
                    color: colorSecondary,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: delFunction,
              child: Container(
                decoration: BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Icon(Icons.delete, color: colorBackup),
                ),
              ),
            ),
          ],
        ));
  }
}
