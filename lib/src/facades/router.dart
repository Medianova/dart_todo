part of api;

class Router {

  List<RouteAction> actions = new List<RouteAction>();

  void get(String path, String action) {
    actions.add(new RouteAction(RouteActionType.GET, path, action));
  }

  void post(String path, String action) {
    actions.add(new RouteAction(RouteActionType.POST, path, action));
  }

  RouteAction resolve(String method, String path) {
    print('trying to resolve: ' + method + ': ' + path);

    for(RouteAction action in actions) {
      if(action.match(method, path)) {
        return action;
      }
    }

    return null;
  }

}
