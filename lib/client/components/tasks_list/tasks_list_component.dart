library Todo.Components.TasksListComponent;

import 'package:angular2/angular2.dart';

import 'package:todo2/client/services/task_service.dart';
import 'package:todo2/client/models/task.dart';

@Component(
    selector: 'tasks-list',
    templateUrl: 'tasks-list.html',
    styleUrls: const ['tasks-list.min.css'],
    directives: const [NgClass])
class TasksListComponent {
  TaskService _taskService;

  @Input() List<Task> tasks;
  @Output() EventEmitter selectTask = new EventEmitter(true);

  TasksListComponent(this._taskService) {
    tasks = _taskService.tasks;
  }

  void onSelectTask(Task t) {
    selectTask.emit(t);
  }

  void onDeactivateTask(Task t) {
    t.active = false;
  }

  void onDeleteTask(Task t) {
    _taskService.removeTask(t);
  }
}
