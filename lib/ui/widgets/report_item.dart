import 'package:danaku/constant/constants.dart';
import 'package:danaku/models/item.dart';
import 'package:danaku/ui/widgets/form_outcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class ReportItem extends StatelessWidget {
  ReportItem({
    Key key,
    @required this.size,
    this.delFunction,
    this.updateFunction,
    this.item,
  }) : super(key: key);

  final Size size;
  final Function delFunction;
  Function updateFunction;
  final Item item;

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
                        item.getName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colorPrimary,
                            fontSize: 15),
                      ),
                      SizedBox(height: 3),
                      Text(
                        item.getDate,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[400],
                            fontSize: 12),
                      ),
                      SizedBox(height: 5),
                      Text(
                        item.getPrice != null ? 'Rp ${FlutterMoneyFormatter(amount: item.getPrice).output.nonSymbol}' : 0,
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
                          child: FormOutcome(
                            buttonText: "Update",
                            size: size.width,
                            onClick: updateFunction,
                            item: item,
                            callbackDismiss: () {
                              Navigator.pop(context);
                            },
                          )),
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
