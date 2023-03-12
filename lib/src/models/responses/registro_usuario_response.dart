import 'dart:convert';
import 'package:health_safe_paciente/src/models/models.dart';

RegistroUsuarioResponse autenticacionResponseFromJson(String str) =>
    RegistroUsuarioResponse.fromJson(json.decode(str));

class RegistroUsuarioResponse {
  RegistroUsuarioResponse({
    this.msg,
    required this.token,
    required this.usuario,
  });

  String? msg;
  String token;
  Usuario usuario;

  factory RegistroUsuarioResponse.fromJson(Map<String, dynamic> json) =>
      RegistroUsuarioResponse(
        msg: json["msg"],
        token: json["token"],
        usuario: Usuario.fromJson(json["usuario"]),
      );
}
