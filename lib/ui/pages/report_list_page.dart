import 'package:danaku/constant/constants.dart';
import 'package:danaku/models/item.dart';
import 'package:danaku/ui/widgets/form_outcome.dart';
import 'package:danaku/ui/widgets/report_item.dart';
import 'package:danaku/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:sqflite/sqflite.dart';

class ReportList extends StatefulWidget {
  final double income;
  final double saving;
  final double outcome;

  const ReportList({Key key, this.income, this.saving, this.outcome})
      : super(key: key);
  @override
  _ReportListState createState() => _ReportListState(income, saving, outcome);
}

class _ReportListState extends State<ReportList> {
  final double income;
  final double saving;
  double outcome;

  _ReportListState(this.income, this.saving, this.outcome);

  DatabaseHelper dbHelper = DatabaseHelper();
  List<Item> itemData;

  void getItemList() {
    final Future<Database> dbFuture = dbHelper.initDatabase('user.db');
    dbFuture.then((database) {
      Future<List<Item>> itemListFuture = dbHelper.getAllItem();
      itemListFuture.then((data) {
        print(data.length);
        setState(() {
          this.itemData = data;
        });
      });
    });
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  void _resetBook() async {
    int result = await dbHelper.deleteDB("item");
    getItemList();

    if (result != 0) {
      outcome = 0;
      _showAlertDialog('Success', 'Data has been reset !');
    } else {
      _showAlertDialog('Failed', 'Error occured while resetting data');
    }
  }

  void _deleteItem(Item item) async {
    if (item.getID == null) {
      _showAlertDialog('Status', 'No Todo was deleted');
      return;
    }

    getItemList();
    getOutcome();
    print("ID ${item.getID}");

    int result = await dbHelper.deleteDB_ID(item.getID, "item");
    if (result != 0) {
      _showAlertDialog('Success', 'Data has been deleted !');
    } else {
      _showAlertDialog('Failed', 'Error Occured while deleting data');
    }
  }

  void getOutcome() {
    final Future<Database> dbFuture = dbHelper.initDatabase('user.db');
    double temp = 0;
    dbFuture.then((database) {
      Future<List<Map<String, dynamic>>> sumPrice = dbHelper.getSumPrice();

      sumPrice.then((value) {
        value[0]['outcome'] == null ? temp = 0 : temp = value[0]['outcome'];
        setState(() {
          outcome = temp;
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    this.getItemList();
  }

  @override
  Widget build(BuildContext context) {
    FlutterMoneyFormatter fIncome = FlutterMoneyFormatter(amount: income);
    FlutterMoneyFormatter fSaving = FlutterMoneyFormatter(amount: saving);
    FlutterMoneyFormatter fOutcome = FlutterMoneyFormatter(amount: outcome);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colorPrimary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
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
                          fontSize: 24),
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
                                    text: 'Rp ${fOutcome.output.nonSymbol}',
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
                                    text: 'Rp ${fIncome.output.nonSymbol}',
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
                                    text: 'Rp ${fSaving.output.nonSymbol}',
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
                          onTap: () {
                            _resetBook();
                          },
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
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ))
                    ],
                  )
                ],
              ),
            ),
            itemData == null
                ? Container(
                    padding: EdgeInsets.only(top: size.height * 0.2),
                    child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation(colorSecondary)),
                  )
                : Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: 25),
                        itemCount: itemData.length,
                        itemBuilder: (BuildContext context, int idx) {
                          return ReportItem(
                            size: size,
                            itemName: itemData[idx].getName,
                            itemPrice: itemData[idx].getPrice,
                            delFunction: () {
                              _deleteItem(itemData[idx]);
                            },
                            itemDate: itemData[idx].getDate,
                          );
                        })),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
        decoration: BoxDecoration(
            color: colorSecondary,
            borderRadius: BorderRadius.circular(25),
            boxShadow: darkShadow),
        height: size.height * 0.065,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.transparent,
                        content: Container(
                            height: size.height * 0.4,
                            child: FormOutcoume("Add", () {}, size.width)),
                      );
                    },
                  );
                },
                child: Text(
                  "Add",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                )),
            Text("|",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500)),
            TextButton(
                onPressed: () {
                  Navigator.pop(context, outcome);
                  FocusScope.of(context).unfocus();
                },
                child: Text(
                  "Back",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
