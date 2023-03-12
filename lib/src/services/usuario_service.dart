import 'dart:io';
import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/services/mocks/registro_usuario_response_mock.dart';
import 'package:health_safe_paciente/src/services/utils/api_exceptions.dart';
import 'package:health_safe_paciente/src/models/responses/registro_usuario_response.dart';
import 'package:health_safe_paciente/src/services/utils/api_response.dart';

class UsuarioService extends ChangeNotifier {
  ApiResponse<RegistroUsuarioResponse>? _registroStatus;
  ApiResponse<RegistroUsuarioResponse>? get registroStatus => _registroStatus;
  set registroStatus(ApiResponse<RegistroUsuarioResponse>? value) {
    _registroStatus = value;
    notifyListeners();
  }

  Future registro(Map<String, String> data, File imagenPerfil,
      File imagenDniFrente, File imagenDniDorso) async {
    registroStatus = ApiResponse.loading();

    await registroService(data, imagenPerfil, imagenDniFrente, imagenDniDorso)
        .then((value) {
      registroStatus = ApiResponse.completed(value);
    }).onError((error, stackTrace) {
      registroStatus = ApiResponse.error(error.toString());
    });
  }

  Future<RegistroUsuarioResponse> registroService(Map<String, String> data,
      File imagenPerfil, File imagenDniFrente, File imagenDniDorso) async {
    // late Map<String, dynamic> response;
    // Uri url = Uri.parse('${Environments.apiUrl}/usuarios/');

    try {
      /*http.MultipartRequest request = http.MultipartRequest("post", url)
        ..fields.addAll(data)
        ..files.addAll([
          await http.MultipartFile.fromPath('imagenPerfil', imagenPerfil.path),
          await http.MultipartFile.fromPath(
              'imagenDniFrente', imagenDniFrente.path),
          await http.MultipartFile.fromPath(
              'imagenDniDorso', imagenDniDorso.path)
        ]);

      http.StreamedResponse streamResponse =
          await request.send().timeout(const Duration(seconds: 10));
      http.Response resp = await http.Response.fromStream(streamResponse);

      debugPrint(resp.body.toString());

      response = apiResponseMapper(resp);

      return RegistroUsuarioResponse.fromJson(response);*/
      return registroUsuaarioResponseMock;
    } on SocketException {
      throw FetchDataException(msg: 'No Internet Connection');
    } catch (e) {
      rethrow;
    }
  }
}
