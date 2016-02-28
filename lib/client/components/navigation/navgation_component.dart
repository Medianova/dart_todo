library Todo.Components.NavigationComponent;

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart' show Router;

import 'package:todo2/client/services/current_user.dart';

@Component(selector: 'navigation', templateUrl: 'navigation.html')
class NavigationComponent {
  CurrentUser _currentUser;
  Router _router;
  @Input() String email;

  NavigationComponent(this._currentUser, this._router) {
    email = _currentUser.email;
  }

  void logout() {
    _currentUser.forget();
    _router.navigate(['/Login']);
  }
}
