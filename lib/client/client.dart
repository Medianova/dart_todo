library Todo;

import 'package:angular2/angular2.dart' show provide;
import 'package:angular2/bootstrap.dart' show bootstrap;
import 'package:angular2/router.dart'
    show APP_BASE_HREF, PathLocationStrategy, LocationStrategy, ROUTER_BINDINGS;

import 'components/app/app_component.dart';
import 'services/current_user.dart';
import 'services/user_api.dart';
import 'services/task_service.dart';
import 'services/category_service.dart';

class Client {
  void run() {
    bootstrap(AppComponent, [
      ROUTER_BINDINGS,
      provide(APP_BASE_HREF, useValue: '/'),
      provide(LocationStrategy, useClass: PathLocationStrategy),
      CurrentUser,
      UserAPI,
      TaskService,
      CategoryService
    ]);
  }
}
