part of Todo.Components.Dialogs;

abstract class BaseDialog {
  @Input() bool isVisible = false;

  void _display() {
    isVisible = true;
  }

  void _hide() {
    isVisible = false;
  }
}
