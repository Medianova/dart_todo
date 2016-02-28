library Todo.Components.LoginComponent;

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart' show Router;

import 'package:todo2/client/services/user_api.dart';
import 'package:todo2/client/services/current_user.dart';

import 'package:todo2/client/models/user.dart';
import 'package:todo2/client/models/login_data.dart';

@Component(
    selector: 'login',
    templateUrl: 'login.html',
    styleUrls: const ['login.min.css'],
    directives: const [NgIf])
class LoginComponent {
  UserAPI _userApi;
  CurrentUser _currentUser;
  Router _router;

  @Input() LoginData loginData = new LoginData();
  bool loginInvalid = false;

  LoginComponent(this._userApi, this._currentUser, this._router);

  void tryToLogin() {
    _userApi.login(loginData).then((User user) {
      loginInvalid = false;
      print("login valid");
      _currentUser.activateUser(user);
      _router.navigate(['/Editor']);
    }).catchError((e) {
      loginInvalid = true;
      print(e.toString());
    });
  }
}
