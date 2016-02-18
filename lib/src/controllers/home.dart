part of api;

class HomeController extends BaseController {

  Response index() {

    return new Response(ContentType.HTML, 200, 'Hello World!');
  }

  Response test([String name]) {

    String text = name != null ? "name == " + name : "name is empty";

    return new Response(ContentType.HTML, 200, 'Test Test! ' + text);
  }

}
