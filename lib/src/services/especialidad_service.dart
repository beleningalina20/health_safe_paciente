import 'dart:io';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/models/responses/obtener_especialidades_response.dart';
import 'package:health_safe_paciente/src/services/mocks/obtenes_especialidades_response_mock.dart';
import 'package:health_safe_paciente/src/services/utils/api_exceptions.dart';

class EspecialidadService {
  static final EspecialidadService especialidadService =
      EspecialidadService._();
  EspecialidadService._();

  List<Especialidad>? _especialidades;

  Future<List<Especialidad>?> get especialidades async {
    _especialidades ??= await obtenerEspecialidades();
    return _especialidades;
  }

  Future<List<Especialidad>?> obtenerEspecialidades() async {
    return await obtenerEspecialidadesService().then((value) {
      return value.especialidades;
    }).onError((error, stackTrace) {
      // return null;
      throw FetchDataException(msg: error.toString());
    });
  }

  Future<ObtenerEspecialidadesResponse> obtenerEspecialidadesService() async {
    // late Map<String, dynamic> response;
    // Uri url = Uri.parse('${Environments.apiUrl}/especialidades/');

    try {
      /*final resp = await http.get(url).timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      response = apiResponseMapper(resp);

      return ObtenerEspecialidadesResponse.fromJson(response);*/
      return obtenerEspecialidadesResponseMock;
    } on SocketException {
      throw FetchDataException(msg: 'No Internet Connection');
    } catch (e) {
      rethrow;
    }
  }
}
