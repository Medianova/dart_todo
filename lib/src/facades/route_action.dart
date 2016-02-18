part of api;

class RouteAction {

  RouteActionType type;
  String fullPath;
  RouteActionPath routePath;
  RequestAction requestAction;

  RouteAction(this.type, this.fullPath, String action) {

    print('building route ' + this.type.toString() + ', ' + this.fullPath + ', ' + action);

    List actionParts = action.split(':');
    requestAction = new RequestAction(actionParts[0], actionParts[1]);

    routePath = new RouteActionPath(fullPath);

    routePath.pathParts.forEach((v) => print(v + '/'));
    routePath.pathVariables.forEach((v) => print(v.type + ','));

  }

  List<String> getVariables(String path) {
    return routePath.getVariables(path);
  }

  bool match(String method, String path) {
    return (
      (method == 'GET' && type == RouteActionType.GET) ||
      (method == 'POST' && type == RouteActionType.POST)
    ) && routePath == path;
  }

}
