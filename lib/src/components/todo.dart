part of todo;

@Component(
    selector: 'todo',
    templateUrl: 'src/templates/todo.html',
    directives: const [ListComponent, CrudTaskComponent]
)
class TodoComponent {

  List<Task> taskList;
  Task selectedTask;
  bool addNewTask = true;

  TodoComponent(TodoListService todoListService) {


    taskList = todoListService.getList();

    selectedTask = new Task();
  }

  void onSelectedTaskChanged(Task task) {
    print('received task: ' + task.getAsString());

    addNewTask = false;
    selectedTask = task;
  }

  void onAddNewTask() {
    print('create new task');
    addNewTask = true;
    selectedTask = new Task();
  }

  void onCreatedNewTask(Task task) {
    addNewTask = false;
    taskList.add(task);
  }

  void onDeleteTask(Task task) {
    addNewTask = true;
    taskList.remove(task);
    selectedTask = new Task();
  }

}
