part of api;

class RouteActionPath {

  List<String> pathParts = new List<String>();
  List<RouteActionVariable> pathVariables = new List<RouteActionVariable>();

  RouteActionPath(String path) {
    for(String pathPart in path.split('/')) {
      if(pathPart.startsWith('(') && pathPart.endsWith(')')) {
        if(pathPart.startsWith('(*')) {
          pathVariables.add(new RouteActionVariable(pathPart.substring(2, pathPart.length - 1), false));
        } else {
          pathVariables.add(new RouteActionVariable(pathPart.substring(1, pathPart.length - 1), true));
        }
      } else {
        pathParts.add(pathPart);
      }
    }
  }

  List<String> getVariables(String path) {

    List<String> variables = new List<String>();
    List<String> requestedPathParts = path.substring(1, path.length).split('/');

    if(requestedPathParts.length <= pathParts.length) {
      return variables;
    }

    for(int i = 0; i < pathVariables.length; i++) {
      if(requestedPathParts.length > i + pathParts.length && requestedPathParts[i + pathParts.length] != null) {
        variables.add(requestedPathParts[i + pathParts.length]);
      }
    }

    return variables;
  }

  bool operator == (o) {

    int i = 0;

    // compare type
    if(o is! String) {
      return false;
    }

    List<String> requestedPathParts = o.substring(1, o.length).split('/');

    if(requestedPathParts.length < pathParts.length) {
      return false;
    }

    for(; i < pathParts.length; i++) {
      if(requestedPathParts[i] != pathParts[i]) {
        return false;
      }
    }

    for(int j = 0; j < pathVariables.length; j++) {
      if(pathVariables[j].required == true && (requestedPathParts.length <= i + j + 1 || (requestedPathParts.length > i + j && requestedPathParts[i + j] == null))) {
        return false;
      }
    }

    return true;
  }

}
