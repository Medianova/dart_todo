library Todo.Exceptions.UserNotFound;

class UserNotFound implements Exception {
  final String message;
  const UserNotFound(this.message);
  String toString() => 'UserNotFound: $message';
}
