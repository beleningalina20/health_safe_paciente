import 'dart:convert';
import 'package:health_safe_paciente/src/models/models.dart';

LoginResponse autenticacionResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

class LoginResponse {
  LoginResponse({
    required this.token,
    required this.usuario,
  });

  String token;
  Usuario usuario;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json["token"],
        usuario: Usuario.fromJson(json["usuario"]),
      );
}
