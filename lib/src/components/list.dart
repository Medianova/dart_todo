part of todo;

@Component(
    selector: 'list',
    templateUrl: 'src/templates/list.html'
)
class ListComponent {

  @Input() List<Task> taskList;

  @Output() EventEmitter selectTask = new EventEmitter(true);

  ListComponent() {
  }

  void onSelectTask(Task selectedTask) {
    print('send task: ' + selectedTask.getAsString());
    selectTask.emit(selectedTask);
  }

}
