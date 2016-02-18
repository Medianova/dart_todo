part of todo;

class TodoListService {

  List<Task> _todoList = new List<Task>();

  TodoListService() {
  }

  void loadList() {
    
  }

  void addTask(Task task) {
    _todoList.add(task);
  }

  List getList() {
    return _todoList;
  }

}
