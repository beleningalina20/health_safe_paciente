import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/models/responses/obtener_localidades_response.dart';

ObtenerLocalidadesResponse obtenerLocalidadesResponseMock =
    ObtenerLocalidadesResponse(localidades: [
  Localidad(codigoPostal: 4000, descripcion: 'San Miguel de Tucumán'),
  Localidad(codigoPostal: 4002, descripcion: 'Yerba Buena'),
  Localidad(codigoPostal: 4003, descripcion: 'Tafi Viejo'),
]);
