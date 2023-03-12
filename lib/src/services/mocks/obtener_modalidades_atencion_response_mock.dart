import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/models/responses/obtener_modalidades_atencion_response.dart';

ObtenerModalidadesAtencionResponse obtenerModalidadesAtencionResponseMock =
    ObtenerModalidadesAtencionResponse(modalidadesAtencion: [
  ModalidadAtencion(idModalidadAtencion: 1, descripcion: 'Presencial'),
  ModalidadAtencion(idModalidadAtencion: 2, descripcion: 'Videollamada'),
]);
