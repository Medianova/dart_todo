library api;

import 'dart:io';
import 'dart:async';
import "dart:mirrors";

part 'src/facades/http.dart';
part 'src/facades/router.dart';
part 'src/facades/controller_factory.dart';
part 'src/facades/response.dart';
part 'src/facades/request_action.dart';
part 'src/facades/route_action.dart';
part 'src/facades/route_action_path.dart';
part 'src/facades/route_action_variable.dart';
part 'src/facades/route_action_type.dart';

part 'src/controllers/base_controller.dart';
part 'src/controllers/home.dart';
part 'src/controllers/user.dart';

main() async {

  Router router = new Router();
  router.get('', 'HomeController:index');
  router.get('test/(*name)', 'HomeController:test');
  router.post('user/login', 'UserController:login');

  Http app = new Http();
  HttpServer requestServer = await app.start(router);

  await for (HttpRequest request in requestServer) {
    app.serve(request);
  }

}
