part of todo;

class UserService {
  User user;

  bool isGuest = true;
  //bool get isValid => user.id > 0;

  UserService() {
    user = new User();
  }

  bool login(String username, String password) {
    print('testing if user can log in');

    getLoginData(username, password).then((_) => print('done'));

    if (username == 'borut' && password == 'borut') {
      user = new User();
      user.id = 1;
      user.username = 'Borut';
      isGuest = false;

      return true;
    }

    return false;
  }

  Future getLoginData(String username, String password) async {
    var client = new BrowserClient();
    var url = 'http://todo.dev:4040/user/login';
    client.post(url, body: {"username": username, "password": password})
        .then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    });
  }
}
