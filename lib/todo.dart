library todo;

import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:angular2/bootstrap.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart' as http;

part 'src/components/app.dart';
part 'src/components/todo.dart';
part 'src/components/list.dart';
part 'src/components/crudTask.dart';
part 'src/components/login.dart';

part 'src/models/task.dart';
part 'src/models/user.dart';

part 'src/services/todoListService.dart';
part 'src/services/userService.dart';

class TodoApp {
  TodoApp() {
    bootstrap(AppComponent, [TodoListService, UserService]);
  }
}
