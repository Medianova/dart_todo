library Todo.Components.TasksListComponent;

import 'package:angular2/angular2.dart';

import 'package:todo2/client/services/task_service.dart';
import 'package:todo2/client/models/task.dart';

import 'package:todo2/client/components/dialogs/dialogs.dart';

@Component(
    selector: 'tasks-list',
    templateUrl: 'tasks-list.html',
    styleUrls: const ['tasks-list.min.css'],
    directives: const [NgClass, NgIf, PromptDialogComponent])
class TasksListComponent {
  TaskService _taskService;

  @Input() List<Task> tasks;
  @Output() EventEmitter selectTask = new EventEmitter(true);

  PromptDialogComponent areYouSureDialog;
  bool areYouSureDialogVisible = false;

  TasksListComponent(this._taskService) {
    tasks = _taskService.tasks;
    areYouSureDialog = new PromptDialogComponent();
  }

  void onSelectTask(Task t) {
    selectTask.emit(t);
  }

  void onDeactivateTask(Task t) {
    t.active = false;
  }

  void onDeleteTask(Task t) {
    areYouSureDialog.show("Are you sure?",
        "Deletion of this task is permanent. Once you delete it will be lost forever!",
        () {
      _taskService.removeTask(t);
      areYouSureDialog.hide();
    }, () {
      areYouSureDialog.hide();
    });
  }
}
