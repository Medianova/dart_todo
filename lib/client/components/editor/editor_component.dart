library Todo.Components.EditorComponent;

import 'package:angular2/angular2.dart';

import 'package:todo2/client/components/navigation/navgation_component.dart';
import 'package:todo2/client/components/tasks_list/tasks_list_component.dart';
import 'package:todo2/client/components/task_crud/task_crud_component.dart';

import 'package:todo2/client/models/task.dart';

@Component(selector: 'editor', templateUrl: 'editor.html', styleUrls: const [
  'editor.min.css'
], directives: const [
  NavigationComponent,
  TasksListComponent,
  TaskCrudComponent
])
class EditorComponent {
  Task currentTask = new Task();
  bool isTaskFromList = false;

  void onSelectedTaskChanged(Task t) {
    currentTask = t;
    isTaskFromList = true;
  }
}
