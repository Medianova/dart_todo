part of api;

class Response {
  ContentType type;
  int statusCode;
  String result;

  Response([this.type, this.statusCode, this.result]);

  Response.html(String text) {
    type = ContentType.HTML;
    statusCode = 200;
    result = text;
  }

  Response.json(Map<String, dynamic> data) {
    type = ContentType.JSON;
    statusCode = 200;
    result = data.toString();
  }
}
