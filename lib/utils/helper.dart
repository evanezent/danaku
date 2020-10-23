import 'package:danaku/models/item.dart';
import 'package:danaku/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static DatabaseHelper _helper;
  static Database _database;

  // USER TABLE
  String userTable = 'user_table';
  String colID = 'id';
  String colName = 'name';
  String colIncome = 'income';
  String colSaving = 'saving';

  // ITEM TABLE
  String itemTable = 'item_table';
  String colDate = 'date';
  String colPrice = 'price';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_helper == null) {
      _helper = DatabaseHelper._createInstance();
    }
    return _helper;
  }

  void _createDb(Database db, int newVersion) async {
    // Create User Table
    await db.execute(
        'CREATE TABLE $userTable($colID INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT, '
        '$colIncome DOUBLE, $colSaving DOUBLE)');
    print("User table created");
    //Create Item Table
    await db.execute(
        'CREATE TABLE $itemTable($colID INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT, '
        '$colDate TEXT, $colPrice DOUBLE)');
    print("Item table created");
  }

  Future<Database> initDatabase(String dbName) async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + dbName;

    // Open/create the database at a given path
    var theDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return theDatabase;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDatabase('user.db');
    }
    return _database;
  }

  // Insert Operation: Insert an object to database
  Future<int> insertDB(Object data) async {
    Database db = await this.database;
    var result;

    if (data is User) {
      result = await db.insert(userTable, data.toMap());
    } else if (data is Item) {
      result = await db.insert(itemTable, data.toMap());
    }

    return result;
  }

  // Update Operation: Update an object and save it to database
  Future<int> updateDB(Object data) async {
    var db = await this.database;
    var result;

    if (data is User) {
      result = await db.update(userTable, data.toMap(),
          where: '$colID = ?', whereArgs: [data.id]);
    } else if (data is Item) {
      result = await db.update(itemTable, data.toMap(),
          where: '$colID = ?', whereArgs: [data.getID]);
    }

    return result;
  }

  // Delete Operation: Delete an object from database
  Future<int> deleteDB_ID(int id, String dbType) async {
    var db = await this.database;
    int result;

    if (dbType == "user") {
      result = await db.rawDelete('DELETE FROM $userTable WHERE $colID = $id');
    } else if (dbType == "item") {
      result = await db.rawDelete('DELETE FROM $itemTable WHERE $colID = $id');
    }

    return result;
  }

  // Delete Operation: Delete all data from database
  Future<int> deleteDB(String dbType) async {
    var db = await this.database;
    int result;

    if (dbType == "user") {
      result = await db.rawDelete('DELETE (*) FROM $userTable');
    } else if (dbType == "item") {
      result = await db.rawDelete('DELETE FROM $itemTable');
    }

    return result;
  }

  // Get number of objects in database
  Future<int> getCount(String dbType) async {
    Database db = await this.database;
    List<Map<String, dynamic>> x;

    if (dbType == "user") {
      x = await db.rawQuery('SELECT COUNT (*) from $userTable');
    } else if (dbType == "item") {
      x = await db.rawQuery('SELECT COUNT (*) from $itemTable');
    }

    int result = Sqflite.firstIntValue(x);
    return result != null ? result : 0;
  }

  // Fetch Operation: Get all object from database
  Future<List<Map<String, dynamic>>> getUserMap() async {
    Database db = await this.database;

    var result = await db.query(userTable, orderBy: '$colName ASC');
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'object List' [ List<Object> ]
  Future<List<User>> getAllUser() async {
    var userMap = await getUserMap();
    int count = userMap.length;

    List<User> userList = List<User>();
    for (int i = 0; i < count; i++) {
      userList.add(User.fromMapObject(userMap[i]));
    }

    return userList;
  }

  // Fetch Operation: Get all object from database
  Future<List<Map<String, dynamic>>> getItemMap() async {
    Database db = await this.database;

    var result = await db.query(itemTable, orderBy: '$colDate ASC');
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'object List' [ List<Object> ]
  Future<List<Item>> getAllItem() async {
    var itemMap = await getItemMap();
    int count = itemMap.length;

    List<Item> itemList = List<Item>();
    for (int i = 0; i < count; i++) {
      itemList.add(Item.fromMapObject(itemMap[i]));
    }

    return itemList;
  }

  // Get sum of price in database
  Future<List<Map<String, dynamic>>> getSumPrice() async {
    Database db = await this.database;
    List<Map<String, dynamic>> result;

    result = await db.rawQuery('SELECT SUM($colPrice) AS outcome from $itemTable');

    // int result = Sqflite.firstIntValue(x);
    print(result);
    return result;
  }
}
