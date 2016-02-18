part of todo;

class Task {

  String name;
  bool active = true;

  Task([this.name]);

  String getAsString() {
    return '[Task ' + name + ']';
  }

}
