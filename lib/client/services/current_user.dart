library Todo.Services.CurrentUser;

import 'package:todo2/client/models/user.dart';

class CurrentUser {
  User _user;

  bool get isActive => _user != null && _user.isActive;
  String get email => _user != null ? _user.email : "";

  void activateUser(User user) {
    _user = user;
  }

  void forget() {
    _user = null;
  }
}
