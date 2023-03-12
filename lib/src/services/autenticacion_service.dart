import 'dart:io';
import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/services/mocks/login_response_mock.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/utils/api_exceptions.dart';
import 'package:health_safe_paciente/src/services/utils/api_response.dart';
import 'package:health_safe_paciente/src/services/utils/local_storage_manager.dart';

class AutenticacionService extends ChangeNotifier {
  late Usuario _usuario;

  Usuario get usuario => _usuario;
  set usuario(Usuario value) {
    _usuario = value;
    notifyListeners();
  }

  ApiResponse<LoginResponse>? _loginStatus;
  ApiResponse<LoginResponse>? get loginStatus => _loginStatus;
  set loginStatus(ApiResponse<LoginResponse>? value) {
    _loginStatus = value;
    notifyListeners();
  }

  Future login(String correo, String contrasena) async {
    loginStatus = ApiResponse.loading();

    await loginService(correo, contrasena).then((value) {
      loginStatus = ApiResponse.completed(value);
      usuario = loginStatus!.data!.usuario;
      LocalStorage.localStorage.setToken(loginStatus!.data!.token);
    }).onError((error, stackTrace) {
      loginStatus = ApiResponse.error(error.toString());
    });
  }

  void logout() async {
    await LocalStorage.localStorage.deleteToken();
    loginStatus = null;
  }

  Future<LoginResponse> loginService(String correo, String contrasena) async {
    // late Map<String, dynamic> response;
    // Uri url = Uri.parse('${Environments.apiUrl}/autenticacion/login');

    try {
      /*final resp = await http.post(url, body: {
        'correo': correo,
        'contrasena': contrasena
      }).timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      response = apiResponseMapper(resp);

      return LoginResponse.fromJson(response);*/
      return loginResponseMock;
    } on SocketException {
      throw FetchDataException(msg: 'No Internet Connection');
    } catch (e) {
      rethrow;
    }
  }
}
