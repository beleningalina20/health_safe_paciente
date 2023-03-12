import 'dart:io';
import 'package:health_safe_paciente/src/models/responses/obtener_modalidades_atencion_response.dart';
import 'package:health_safe_paciente/src/services/mocks/obtener_modalidades_atencion_response_mock.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/utils/api_exceptions.dart';

class ModalidadAtencionService {
  static final ModalidadAtencionService modalidadAtencionService =
      ModalidadAtencionService._();
  ModalidadAtencionService._();

  List<ModalidadAtencion>? _modadalidadesAtencion;

  Future<List<ModalidadAtencion>?> get modalidadesAtencion async {
    _modadalidadesAtencion ??= await obtenerEspecialidades();
    return _modadalidadesAtencion;
  }

  Future<List<ModalidadAtencion>?> obtenerEspecialidades() async {
    return await obtenerModalidadesAtencionService().then((value) {
      return value.modalidadesAtencion;
    }).onError((error, stackTrace) {
      // return null;
      throw FetchDataException(msg: error.toString());
    });
  }

  Future<ObtenerModalidadesAtencionResponse>
      obtenerModalidadesAtencionService() async {
    // late Map<String, dynamic> response;
    // Uri url = Uri.parse('${Environments.apiUrl}/modalidadesAtencion/');

    try {
      /*final resp = await http.get(url).timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      response = apiResponseMapper(resp);

      return ObtenerEspecialidadesResponse.fromJson(response);*/
      return obtenerModalidadesAtencionResponseMock;
    } on SocketException {
      throw FetchDataException(msg: 'No Internet Connection');
    } catch (e) {
      rethrow;
    }
  }
}
