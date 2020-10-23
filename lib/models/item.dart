class Item {
  int _id;
  String _name, _date;
  double _price;

  Item(this._name, this._price, this._date);
  Item.withId(this._id, this._name, this._price, this._date);

  int get getID => _id;
  String get getName => _name;
  String get getDate => _date;
  double get getPrice => _price;

  set setName(String newName) {
    if (100 >= newName.length && newName.length > 0) {
      this._name = newName;
    }
  }

  set setPrice(String newPrice) {
    if (newPrice.length > 0) {
      this._price = double.parse(newPrice);
    }
  }

  set setDate(String newDate) {
    if (newDate.length > 0) {
      this._date = newDate;
    }
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (getID != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['date'] = _date;
    map['price'] = _price;

    return map;
  }

  Item.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._date = map['date'];
    this._price = map['price'];
  }
}
