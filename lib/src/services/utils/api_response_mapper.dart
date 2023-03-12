import 'dart:convert';
import 'package:health_safe_paciente/src/services/utils/api_exceptions.dart';
import 'package:http/http.dart' as http;

Map<String, dynamic> apiResponseMapper(http.Response response) {
  switch (response.statusCode) {
    case 200:
    case 201:
      Map<String, dynamic> responseJson = jsonDecode(response.body);
      return responseJson;
    case 400:
      throw BadRequestException(msg: response.body.toString());
    case 404:
      throw BadRequestException(msg: response.body.toString());
    case 500:
      throw BadRequestException(msg: response.body.toString());
    default:
      throw FetchDataException(
          msg:
              "Error accourded while communicating with server with status code ${response.statusCode}");
  }
}
