import 'package:flutter/cupertino.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String _correo = '';
  String _contrasena = '';

  String get correo => _correo;
  set correo(String value) {
    _correo = value;
    notifyListeners();
  }

  String get contrasena => _contrasena;
  set contrasena(String value) {
    _contrasena = value;
    notifyListeners();
  }

  bool isValidForm() {
    if (formKey.currentState == null) return false;
    return formKey.currentState!.validate() && correo != '' && contrasena != '';
  }
}
