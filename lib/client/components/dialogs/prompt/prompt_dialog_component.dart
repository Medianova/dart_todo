part of Todo.Components.Dialogs;

@Component(
    selector: 'prompt-dialog',
    templateUrl: 'prompt/prompt-dialog.html',
    directives: const [NgIf])
class PromptDialogComponent extends BaseDialog {
  @Input() String title = "Are you sure?";
  @Input() String message = "Are you sure?";

  DialogAction actionOk = DialogAction.OK;
  DialogAction actionCancel = DialogAction.CANCEL;

  Function _onOkFunction;
  Function _onCancelFunction;

  void show(String title, String message,
      [Function onOkFunction = null, Function onCancelFunction = null]) {
    this.title = title;
    this.message = message;
    _display();

    _onOkFunction = onOkFunction;
    _onCancelFunction = onCancelFunction;
  }

  void actionHandler(DialogAction action) {
    print("here");
    hide();
    if (action == DialogAction.OK && _onOkFunction != null) {
      _onOkFunction();
    } else if (action == DialogAction.CANCEL && _onCancelFunction != null) {
      _onCancelFunction();
    }
  }
}
