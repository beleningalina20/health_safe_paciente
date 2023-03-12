import 'dart:io';
import 'package:flutter/material.dart';

class RegistroUsuarioFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int cantidadPasos = 4;

  int _pasoActual = 0;
  int get pasoActual => _pasoActual;
  set pasoActual(int value) {
    _pasoActual = value;
    notifyListeners();
  }

  List<String> sexos = ['Femenino', 'Masculino'];

  String _correo = '';
  String _contrasena = '';
  File? _imagenPerfil;
  String _nombre = '';
  String _apellido = '';
  String _sexo = 'Femenino';
  DateTime? _fechaNacimiento;
  String _dni = '';
  File? _imagenDniFrente;
  File? _imagenDniDorso;

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

  File? get imagenPerfil => _imagenPerfil;
  set imagenPerfil(File? value) {
    _imagenPerfil = value;
    notifyListeners();
  }

  String get nombre => _nombre;
  set nombre(String value) {
    _nombre = value;
    notifyListeners();
  }

  String get apellido => _apellido;
  set apellido(String value) {
    _apellido = value;
    notifyListeners();
  }

  DateTime? get fechaNacimiento => _fechaNacimiento;
  set fechaNacimiento(DateTime? value) {
    _fechaNacimiento = value;

    notifyListeners();
  }

  String get dni => _dni;
  set dni(String value) {
    _dni = value;
    notifyListeners();
  }

  String get sexo => _sexo;
  set sexo(String value) {
    _sexo = value;
    notifyListeners();
  }

  File? get imagenDniFrente => _imagenDniFrente;
  set imagenDniFrente(File? value) {
    _imagenDniFrente = value;
    notifyListeners();
  }

  File? get imagenDniDorso => _imagenDniDorso;
  set imagenDniDorso(File? value) {
    _imagenDniDorso = value;
    notifyListeners();
  }

  bool isValidForm() {
    if (formKey.currentState == null) return false;
    return formKey.currentState!.validate() &&
        correo != '' &&
        contrasena != '' &&
        nombre != '' &&
        apellido != '' &&
        dni != '' &&
        fechaNacimiento != null &&
        imagenPerfil != null &&
        imagenDniFrente != null &&
        imagenDniDorso != null &&
        sexo != '';
  }

  Map<String, String> data() {
    return {
      'correo': correo,
      'contrasena': contrasena,
      'nombre': nombre,
      'apellido': apellido,
      'dni': dni,
      'sexo': sexo,
      'fechaNacimiento': fechaNacimiento.toString(),
      'idRol': '1'
    };
  }

  // Validators
  String? correoValidator(String? value) {
    if (value == null || value == '') return null;
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);

    return regExp.hasMatch(value) ? null : 'No tiene formato de correo';
  }

  String? contrasenaValidator(String? value) {
    if (value == null || value == '') return null;

    String pattern = r'^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,16}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value)
        ? null
        : 'Debe tener entre 8 a 16 caracteres y 1 mayúscula';
  }

  String? dniValidator(String? value) {
    if (value == null || value == '') return null;

    String pattern = r'[0-9]{8}';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value) ? null : 'Ingrese un DNI válido';
  }

  bool esMayorEdad() {
    if (fechaNacimiento != null) {
      Duration difference = DateTime.now().difference(fechaNacimiento!);
      double edad = difference.inDays / 365;
      return edad >= 18.0;
    }
    return false;
  }
}
