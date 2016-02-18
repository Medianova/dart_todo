part of todo;

@Component(
    selector: 'crud-task',
    templateUrl: 'src/templates/crudTask.html'
)
class CrudTaskComponent {

  @Input() Task task;

  @Input() bool isNewTask;

  @Output() EventEmitter createdNewTask = new EventEmitter(true);
  @Output() EventEmitter deleteTask = new EventEmitter(true);

  void onAddNewTask() {
    createdNewTask.emit(task);
  }

  void onDeleteTask() {
    deleteTask.emit(task);
  }

  void onTaskDone() {
    task.active = false;
  }

}