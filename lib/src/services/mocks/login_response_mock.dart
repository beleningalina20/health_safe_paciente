import 'package:health_safe_paciente/src/models/models.dart';

LoginResponse loginResponseMock = LoginResponse(
    token: 'token-mock',
    usuario: Usuario(
        idusuario: 1,
        apellido: 'Ingalina',
        contrasena: 'beleningalinaA1',
        correo: 'beleningalina@gmail.com',
        dni: 39977027,
        fechaNacimiento: DateTime(1996, 10, 25),
        imagenDniDorso: '',
        imagenDniFrente: '',
        imagenPerfil:
            'https://res.cloudinary.com/healthsafeapp/image/upload/v1665864338/s4wf7231ww091q26jybh.jpg',
        nombre: 'María Belén',
        rol: Rol(idrol: 1, descripcion: 'Paciente'),
        sexo: 'Femenino'));
