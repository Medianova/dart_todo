part of Todo.Components.Dialogs;

abstract class BaseDialog {
  @Input() bool isVisible = false;
  @Output() EventEmitter actionEvent = new EventEmitter(true);

  void actionHandler(DialogAction action);

  void _display() {
    isVisible = true;
  }

  void hide() {
    isVisible = false;
  }

  void onHandleAction(DialogAction action) {
    print(action.toString());
    actionEvent.emit("yeah");
  }
}
