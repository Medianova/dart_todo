part of api;

class UserController extends BaseController {
  Response login() {
    return new Response.json({'login': 1});
  }
}
