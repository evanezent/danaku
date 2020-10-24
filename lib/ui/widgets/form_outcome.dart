import 'package:danaku/constant/constants.dart';
import 'package:danaku/models/item.dart';
import 'package:danaku/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class FormOutcome extends StatelessWidget {
  FormOutcome(
      {Key key,
      this.buttonText,
      this.onClick,
      this.size,
      this.item,
      this.callbackDismiss})
      : super(key: key);

  final String buttonText;
  final Function onClick, callbackDismiss;
  final double size;
  final Item item;

  TextEditingController textItem = new TextEditingController();
  TextEditingController textPrice = new TextEditingController();

  DatabaseHelper dbHelper = DatabaseHelper();
  Item itemData;

  void updateItem(Item data) async {
    Item newItem =
        Item.withId(data.getID, data.getName, data.getPrice, data.getDate);
    print("ID ${data.getID} === ${newItem.getID}");

    int res = await dbHelper.updateDB(newItem);
    toastMessage(res);
  }

  void toastMessage(int res) {
    if (res != 0) {
      Fluttertoast.showToast(
        msg: "Update Success",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: colorSecondary,
        textColor: Colors.white,
      );
      // Callback for report list to update list
      this.onClick();

      // Callback for report item to dissmis dialog
      this.callbackDismiss();
    } else {
      Fluttertoast.showToast(
        msg: "Update Failed !",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: colorBackup,
        textColor: Colors.white,
      );
    }
  }

  void addItem(String name, String price) async {
    String newDate = DateFormat.yMMMd().format(DateTime.now());
    Item newItem = Item(name, double.parse(price), newDate);
    print("Name ${name} === Price ${price}");

    int res = await dbHelper.insertDB(newItem);
    toastMessage(res);
  }

  @override
  Widget build(BuildContext context) {
    textItem.text = this.item != null ? this.item.getName : '' ;
    textPrice.text = this.item != null ? this.item.getPrice.toStringAsFixed(0) : '';
    itemData = this.item;

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
                onPressed: buttonText == 'Update'
                    ? () {
                        updateItem(Item.withId(this.item.getID, textItem.text,
                            double.parse(textPrice.text), this.item.getDate));
                      }
                    : () {
                        addItem(textItem.text, textPrice.text);
                      },
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
}
