import 'package:health_safe_paciente/src/models/models.dart';

class ObtenerLocalidadesResponse {
  String? msg;
  List<Localidad> localidades;

  ObtenerLocalidadesResponse({this.msg, required this.localidades});

  factory ObtenerLocalidadesResponse.fromJson(Map<String, dynamic> json) =>
      ObtenerLocalidadesResponse(
          msg: json["msg"],
          localidades: List<Localidad>.from(
              json["localidades"].map((x) => Especialidad.fromJson(x))));
}
