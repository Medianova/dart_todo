part of api;

class ControllerFactory {

  static BaseController create(String controller) {

    MirrorSystem mirrors = currentMirrorSystem();
    LibraryMirror lm = mirrors.libraries.values.firstWhere(
      (LibraryMirror lm) => lm.qualifiedName == new Symbol('api'));

    ClassMirror cm = lm.declarations[new Symbol(controller)];

    try {

      InstanceMirror im = cm.newInstance(new Symbol(''), []);
      return im.reflectee;

    } on Exception catch(e) {

      print(e);
    }

    return null;
  }

}
