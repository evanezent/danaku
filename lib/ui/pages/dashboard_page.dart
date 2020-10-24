import 'package:danaku/constant/constants.dart';
import 'package:danaku/models/item.dart';
import 'package:danaku/models/user.dart';
import 'package:danaku/ui/pages/profile_page.dart';
import 'package:danaku/ui/pages/report_list_page.dart';
import 'package:danaku/ui/widgets/dashboard_header.dart';
import 'package:danaku/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  User user;
  var _formKey = GlobalKey<FormState>();
  DatabaseHelper dbHelper = DatabaseHelper();
  Item itemData;
  double outcome;
  var textItem = TextEditingController();
  var textPrice = TextEditingController();

  List<User> userList;
  int count = 0;

  void getInitData() {
    final Future<Database> dbFuture = dbHelper.initDatabase('user.db');
    dbFuture.then((database) {
      Future<List<User>> userListFuture = dbHelper.getAllUser();

      userListFuture.then((val) {
        setState(() {
          this.user = val[0];
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

  void addData() async {
    String newDate = DateFormat.yMMMd().format(DateTime.now());
    itemData = Item(textItem.text, double.parse(textPrice.text), newDate);

    int res = await dbHelper.insertDB(itemData);
    res == 0
        ? _showAlertDialog("Failed", "Error while add data !")
        : _showAlertDialog("Success", "Data successfully added !");

    getOutcome();
    _formKey.currentState.reset();
  }

  void getOutcome() {
    final Future<Database> dbFuture = dbHelper.initDatabase('user.db');
    double temp = 0;
    dbFuture.then((database) {
      Future<List<Map<String, dynamic>>> sumPrice = dbHelper.getSumPrice();

      sumPrice.then((value) {
        print("OUTCOME ==================> ${value[0]['outcome']}");
        value[0]['outcome'] == null ? temp = 0 : temp = value[0]['outcome'];
        print("OUTCOME ==================> $temp");
        setState(() {
          this.outcome = temp;
        });
      });
    });
  }

  void updateOutcome(double outcome) {
    setState(() => this.outcome = outcome);
  }

  void updateUser(User newUser) {
    setState(() => this.user = newUser);
  }

  @override
  void initState() {
    //
    super.initState();
    this.getOutcome();
    this.getInitData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colorPrimary,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 20),
            DashboardHeader(
              nickname: user != null ? user.name : '',
              income: user != null ? user.income : 0,
              saving: user != null ? user.saving : 0,
              outcome: outcome != null ? outcome : null,
            ),
            SizedBox(height: size.height * 0.12),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage(
                                    userData: user,
                                  )));
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: navShadow),
                      child: Icon(
                        Icons.person_pin,
                        color: colorSecondary,
                        size: 50,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReportList(
                                    income: user.income,
                                    saving: user.saving,
                                    outcome: outcome,
                                  )));
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: navShadow),
                      child: Icon(
                        Icons.list_sharp,
                        color: colorSecondary,
                        size: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              margin: EdgeInsets.only(top: 50, left: 20, right: 20),
              padding: EdgeInsets.all(14),
              width: size.width,
              decoration: BoxDecoration(
                  color: colorSecondary,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: darkShadow),
              child: Form(
                key: _formKey,
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
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
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
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.white,
                        onPressed: () {
                          addData();
                        },
                        child: Text(
                          "Add",
                          style: TextStyle(
                              color: colorSecondary,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
