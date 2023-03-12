import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:health_safe_paciente/src/services/utils/environments.dart';
import 'package:health_safe_paciente/src/models/models.dart';

class AutenticacionService with ChangeNotifier {
  late Usuario _usuario;

  bool _isLoading = false;

  final _storage = const FlutterSecureStorage();

  Usuario get usuario => _usuario;
  set usuario(Usuario value) {
    _usuario = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  static Future<String?> getToken() async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    return token;
  }

  static Future<void> deleteToken() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'token');
  }

  Future registroUsuario() async {
    isLoading = true;
    // Uri url = Uri.parse("${Environment.apiUrl}/usuarios");

    try {
      /*var request = http.MultipartRequest("post", url)
        ..headers.addAll({'Content-Type': 'application/json'})
        ..fields.addAll({})
        ..files.addAll([
          http.MultipartFile.fromString('imagenPerfil', ''),
          http.MultipartFile.fromString('imagenDniFrente', ''),
          http.MultipartFile.fromString('imagenDniDorso', ''),
        ]);

      var response = await request.send();
      var resp = await http.Response.fromStream(response);

      if (resp.statusCode != 201) return false;*/
      isLoading = false;
      /*

      final autenticacionUsuarioResponse =
          autenticacionResponseFromJson(resp.body);*/
      usuario = Usuario(
        idusuario: 6,
        correo: "maria-perez@gmail.com",
        contrasena: "MariaPerez3",
        dni: 25789654,
        nombre: "Maria",
        apellido: "Perez",
        fechaNacimiento: DateTime(1984, 10, 25),
        sexo: "FEMENINO",
        imagenPerfil:
            'https://aishlatino.com/wp-content/uploads/2021/11/que-tipo-de-persona-te-gustaria-ser-730x411-SP.jpg',
        imagenDniFrente: "",
        imagenDniDorso: "",
        rol: Rol(idrol: 1, descripcion: "PACIENTE"),
      );
      await _guardarToken('token');

      isLoading = false;
    } catch (e) {
      isLoading = false;
      throw Exception(e.toString());
    }
  }

  Future login(String correo, String contrasena) async {
    isLoading = true;

    // var url = Uri.parse('${Environment.apiUrl}/api/auth/login');

    try {
      /*final resp = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: {'correo': correo, 'contrasena': contrasena});

      if (resp.statusCode != 201) return false;*/
      isLoading = false;

      /*final loginUsuarioResponse = autenticacionResponseFromJson(resp.body);
      usuario = loginUsuarioResponse.usuario;*/

      usuario = Usuario(
        idusuario: 6,
        correo: "maria-perez@gmail.com",
        contrasena: "MariaPerez3",
        dni: 25789654,
        nombre: "Maria",
        apellido: "Perez",
        fechaNacimiento: DateTime(1984, 10, 25),
        sexo: "FEMENINO",
        imagenPerfil:
            'https://aishlatino.com/wp-content/uploads/2021/11/que-tipo-de-persona-te-gustaria-ser-730x411-SP.jpg',
        imagenDniFrente: "",
        imagenDniDorso: "",
        rol: Rol(idrol: 1, descripcion: "PACIENTE"),
      );

      await _guardarToken('token');
    } catch (e) {
      isLoading = false;
      throw Exception(e.toString());
    }
  }

  Future _guardarToken(String token) async =>
      await _storage.write(key: 'token', value: token);

  Future logout() async => await _storage.delete(key: 'token');
}
