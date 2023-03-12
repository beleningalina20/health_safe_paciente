import 'package:health_safe_paciente/src/models/models.dart';

class ObtenerEspecialidadesResponse {
  String? msg;
  List<Especialidad> especialidades;

  ObtenerEspecialidadesResponse({this.msg, required this.especialidades});

  factory ObtenerEspecialidadesResponse.fromJson(Map<String, dynamic> json) =>
      ObtenerEspecialidadesResponse(
          msg: json["msg"],
          especialidades: List<Especialidad>.from(
              json["especialidades"].map((x) => Especialidad.fromJson(x))));
}
