library Todo.Models.Task;

class Task {
  String title;
  String description;
  String category;
  bool active = true;

  bool get isValid => title != null && title != "" && category != null;

  Task([this.title, this.description, this.category, this.active]);
}
