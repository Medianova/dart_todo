part of todo;

@Component(
    selector: 'login',
    templateUrl: 'src/templates/login.html'
)
class LoginComponent {

  UserService userService;

  LoginComponent(this.userService);

	@Output() EventEmitter userLogin = new EventEmitter(true);

	void login(String username, String password) {

    // animate

    new Timer(new Duration(milliseconds: 1), () => tryToLogin(username, password));
	}

  void tryToLogin(String username, String password) {

    if(userService.login(username, password)) {
      userLogin.emit(true);
    } else {
      // display error
    }

    // stop animation

  }

}
