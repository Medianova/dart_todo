part of api;

class Http {
  static final Http _singleton = new Http._internal();

  Router router = new Router();
  HttpServer requestServer = null;

  factory Http() {
    return _singleton;
  }

  Http._internal();

  Future<HttpServer> start(Router router) async {
    this.router = router;
    return await HttpServer.bind(InternetAddress.ANY_IP_V4, 4040);
  }

  /**
   *
  */
  void serve(HttpRequest request) {
    RouteAction action = router.resolve(request.method, request.uri.path);

    if (action != null) {
      print('resolved action: ' +
          action.requestAction.controllerName +
          ':' +
          action.requestAction.methodName);

      BaseController controller =
          ControllerFactory.create(action.requestAction.controllerName);

      if (controller != null) {
        // execute
        try {
          InstanceMirror im = reflect(controller);

          InstanceMirror r = im.invoke(
              new Symbol(action.requestAction.methodName),
              action.getVariables(request.uri.path));
          Response result = r.reflectee;

          print('sending back result:');
          print('content type:' + result.type.toString());
          print('with status code:' + result.statusCode.toString());
          print(result.result);

          request.response.statusCode = result.statusCode;
          request.response.headers.contentType = result.type;
          request.response.write(result.result);
        } catch (exception, stackTrace) {
          print(exception);
          print(stackTrace);

          request.response.statusCode = 500;
          request.response.headers.contentType = request.headers.contentType;
          request.response.write(exception);
        }
      } else {
        request.response.statusCode = 500;
        request.response.headers.contentType = request.headers.contentType;
        request.response.write("can't find controller");
      }
    } else {
      request.response.statusCode = 500;
      request.response.headers.contentType = request.headers.contentType;
      request.response.write("route can't be resolved");
    }

    addCorsHeaders(request.response);

    request.response.close();
  }

  /**
   * Add Cross-site headers to enable accessing this server from pages
   * not served by this server
   *
   * See: http://www.html5rocks.com/en/tutorials/cors/
   * and http://enable-cors.org/server.html
   */
  void addCorsHeaders(HttpResponse res) {
    res.headers.add("Access-Control-Allow-Origin", "*");
    res.headers.add("Access-Control-Allow-Methods", "POST, GET");
    res.headers.add("Access-Control-Allow-Headers",
        "Origin, X-Requested-With, Content-Type, Accept");
  }
}
