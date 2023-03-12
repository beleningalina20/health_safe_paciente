import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/models/responses/obtener_especialidades_response.dart';

ObtenerEspecialidadesResponse obtenerEspecialidadesResponseMock =
    ObtenerEspecialidadesResponse(especialidades: [
  Especialidad(idEspecialidad: 1, descripcion: 'Medicina Clinica'),
  Especialidad(idEspecialidad: 2, descripcion: 'Ginecología'),
  Especialidad(idEspecialidad: 3, descripcion: 'Odontología'),
]);
