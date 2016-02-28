library Todo.Models.User;

class User {
  int _id;
  int get id => _id;

  String _email;
  String get email => _email;

  bool _active = false;
  bool get isActive => _active;

  User(this._id, this._email, this._active);
}
