library Todo.Services.UserAPI;

import 'dart:async';

import 'package:todo2/client/models/login_data.dart';
import 'package:todo2/client/models/user.dart';
import 'package:todo2/client/exceptions/user_not_found.dart';

class UserAPI {
  Future login(LoginData loginData) async {
    if (loginData.email == "admin" && loginData.password == "1234") {
      return new User(1, 'admin', true);
    }

    throw new UserNotFound('User not found. Check email and/or password.');
  }
}
