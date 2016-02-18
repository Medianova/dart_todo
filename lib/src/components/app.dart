part of todo;

@Component(
    selector: 'todo-app',
    templateUrl: 'src/templates/app.html',
    directives: const [LoginComponent, TodoComponent]
)
class AppComponent {

  bool isUserGuest = true;

	void onUserLogin(bool isValidUser) {
    isUserGuest = !isValidUser;
	}
}
