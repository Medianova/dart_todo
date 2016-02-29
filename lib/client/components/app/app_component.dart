library Todo.Components.AppComponent;

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';

import 'package:todo2/client/services/current_user.dart';
import 'package:todo2/client/components/login/login_component.dart';
import 'package:todo2/client/components/editor/editor_component.dart';

@Component(
    selector: 'my-app',
    templateUrl: 'app.html',
    styleUrls: const ['app.min.css'],
    directives: const [RouterOutlet, RouterLink])
@RouteConfig(const [
  const Route(
      path: '/',
      component: EditorComponent,
      name: 'EditorRoute',
      useAsDefault: true),
  const Route(path: '/login', component: LoginComponent, name: 'LoginRoute')
])
class AppComponent {
  Router _router;
  CurrentUser _currentUser;

  AppComponent(this._router, this._currentUser) {
    if (_currentUser.isActive == false) {
      _router.navigate(['LoginRoute']);
    }
  }
}
