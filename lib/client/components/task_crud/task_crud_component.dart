library Todo.Components.TaskCrudComponent;

import 'package:angular2/angular2.dart';

import 'package:todo2/client/services/category_service.dart';
import 'package:todo2/client/services/task_service.dart';
import 'package:todo2/client/models/task.dart';

@Component(selector: 'task-crud', templateUrl: 'task-crud.html')
class TaskCrudComponent {
  CategoryService _categoryService;
  TaskService _taskService;

  @Input() Task task = new Task();
  @Input() bool isNew = true;
  @Input() List<String> categories;

  bool isNewTask = true;

  TaskCrudComponent(this._categoryService, this._taskService) {
    categories = _categoryService.categories;
  }

  void onNewTask() {
    task = new Task();
    isNew = true;
  }

  void onSaveTask() {
    _taskService.addTask(task);
    isNew = false;
  }
}
