import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/models/responses/obtener_localidades_response.dart';
import 'package:health_safe_paciente/src/services/mocks/obtener_localidades_response_mock.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/utils/api_exceptions.dart';
import 'package:health_safe_paciente/src/services/utils/api_response_mapper.dart';
import 'package:health_safe_paciente/src/services/utils/environments.dart';

class LocalidadService {
  static final LocalidadService localidadService = LocalidadService._();
  LocalidadService._();

  List<Localidad>? _localidades;

  Future<List<Localidad>?> get localidades async {
    _localidades ??= await obtenerLocalidades();
    return _localidades;
  }

  Future<List<Localidad>?> obtenerLocalidades() async {
    return await obtenerLocalidadesService().then((value) {
      return value.localidades;
    }).onError((error, stackTrace) {
      // return null;
      throw FetchDataException(msg: error.toString());
    });
  }

  Future<ObtenerLocalidadesResponse> obtenerLocalidadesService() async {
    late Map<String, dynamic> response;
    Uri url = Uri.parse('${Environments.apiUrl}/localidades/');

    try {
      /*final resp = await http.get(url).timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      response = apiResponseMapper(resp);

      return ObtenerEspecialidadesResponse.fromJson(response);*/
      return obtenerLocalidadesResponseMock;
    } on SocketException {
      throw FetchDataException(msg: 'No Internet Connection');
    } catch (e) {
      rethrow;
    }
  }
}
