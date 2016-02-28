library Todo.Services.TaskService;

import 'package:todo2/client/models/task.dart';

class TaskService {
  List<Task> _tasks = new List<Task>();

  List<Task> get tasks => _tasks;

  TaskService() {
    _createRandomTasks();
  }

  void addTask(Task t) {
    _tasks.add(t);
  }

  void removeTask(Task t) {
    _tasks.remove(t);
  }

  void _createRandomTasks() {
    addTask(new Task(
        "Task 1",
        "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
        "Home"));

    addTask(new Task(
        "Task 2",
        "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
        "Home"));

    addTask(new Task(
        "Task 3",
        "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
        "Home"));
  }
}
