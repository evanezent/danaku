class User {
  int _id;
  String _name;
  double _income, _saving;

  User(this._name, this._income, this._saving);
  User.withId(this._id, this._name, this._income, this._saving);

  int get id => _id;
  String get name => _name;
  double get income => _income;
  double get saving => _saving;

  set setName(String newName) {
    if (100 >= newName.length && newName.length > 0) {
      this._name = newName;
    }
  }

  set setIncome(double newIncome) {
    if (newIncome > 0) {
      this._income = newIncome;
    }
  }

  set setSaving(double newSaving) {
    if (newSaving > 0) {
      this._saving = newSaving;
    }
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['income'] = _income;
    map['saving'] = _saving;

    return map;
  }

  User.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._income = map['income'];
    this._saving = map['saving'];
  }
}
