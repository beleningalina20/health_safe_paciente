import 'package:flutter/material.dart';

class RegistroUsuarioPage extends StatelessWidget {
  static const String routeName = 'RegistroUsuarioPage';
  const RegistroUsuarioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(); /*SafeArea(
        child: Scaffold(
            backgroundColor: ColorsApp.azulLogin,
            body: Padding(
                padding: EdgeInsets.only(
                    top: SizeConfig.height * 0.02,
                    left: SizeConfig.height * 0.02,
                    right: SizeConfig.height * 0.02),
                child: ChangeNotifierProvider(
                  create: (_) => RegistroUsuarioProvider(),
                  child: Column(
                    children: [
                      _TituloRegistroPaciente(),
                      SizedBox(height: SizeConfig.height * 0.015),
                      _FormRegistroUsuario(),
                      SizedBox(height: SizeConfig.height * 0.015),
                      _ItemsPageView(),
                      SizedBox(height: SizeConfig.height * 0.01),
                      _DeclaracionTerminosCondiciones(),
                      _BotonFinalizar()
                    ],
                  ),
                ))));*/
  }
}

/*class _TituloRegistroPaciente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Registro de usuario',
      style: Theme.of(context)
          .textTheme
          .headline1!
          .copyWith(color: Colors.white, decoration: TextDecoration.underline),
    );
  }
}

class _FormRegistroUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registroUsuarioProvider =
        Provider.of<RegistroUsuarioProvider>(context);

    return Expanded(
      child: Form(
        key: registroUsuarioProvider.formKey,
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: registroUsuarioProvider.pageController,
          onPageChanged: (value) =>
              registroUsuarioProvider.paginaActual = value,
          children: [
            _CorreoContrasenaImagenPerfilTextFormField(),
            _InformacionPersonalTextFormField(),
            _ImagenesDniFormField()
          ]
              .map((page) => SingleChildScrollView(
                    child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.height * 0.015),
                        child: page),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class _CorreoContrasenaImagenPerfilTextFormField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registroUsuarioProvider =
        Provider.of<RegistroUsuarioProvider>(context);

    return Column(
      children: [
        TextFormFieldCustom(
            label: 'Correo',
            labelColor: Colors.white,
            keyboardType: TextInputType.emailAddress,
            value: registroUsuarioProvider.correo,
            onChanged: (String value) => registroUsuarioProvider.correo = value,
            validator: registroUsuarioProvider.correoValidator),
        SizedBox(height: SizeConfig.height * 0.015),
        TextFormFieldCustom(
          label: 'Contraseña',
          labelColor: Colors.white,
          isPassword: true,
          value: registroUsuarioProvider.contrasena,
          validator: registroUsuarioProvider.contrasenaValidator,
          onChanged: (String value) =>
              registroUsuarioProvider.contrasena = value,
        ),
        SizedBox(height: SizeConfig.height * 0.015),
        Text('Imagen de perfil',
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: Colors.white)),
        SizedBox(height: SizeConfig.height * 0.015),
        Center(
            child: ImagenPerfil(
          cambiarImagenPerfil: true,
          imagenPerfil: registroUsuarioProvider.imagenPerfil,
          onChanged: (value) => registroUsuarioProvider.imagenPerfil = value,
        )),
      ],
    );
  }
}

class _InformacionPersonalTextFormField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registroUsuarioProvider =
        Provider.of<RegistroUsuarioProvider>(context);

    return Column(
      children: [
        TextFormFieldCustom(
          label: 'Nombre',
          labelColor: Colors.white,
          value: registroUsuarioProvider.nombre,
          validator: (String? value) =>
              (value != '') ? null : 'Ingrese su nombre',
          onChanged: (String value) => registroUsuarioProvider.nombre = value,
        ),
        SizedBox(height: SizeConfig.height * 0.015),
        TextFormFieldCustom(
          label: 'Apellido',
          labelColor: Colors.white,
          value: registroUsuarioProvider.apellido,
          validator: (String? value) =>
              (value != '') ? null : 'Ingrese su apellido',
          onChanged: (String value) => registroUsuarioProvider.apellido = value,
        ),
        SizedBox(height: SizeConfig.height * 0.015),
        TextFormFieldCustom(
          label: 'Dni',
          keyboardType: TextInputType.number,
          labelColor: Colors.white,
          value: registroUsuarioProvider.dni,
          validator: registroUsuarioProvider.dniValidator,
          onChanged: (String value) => registroUsuarioProvider.dni = value,
        ),
        SizedBox(height: SizeConfig.height * 0.015),
        DropDownButtonCustom<String>(
          label: 'Sexo',
          labelColor: Colors.white,
          items: registroUsuarioProvider.sexos,
          value: registroUsuarioProvider.sexo,
          onChanged: (String? value) =>
              registroUsuarioProvider.sexo = value ?? 'Femenino',
        ),
        SizedBox(height: SizeConfig.height * 0.015),
        TextFormFieldCustom(
            label: 'Fecha de Nacimiento',
            onTap: () async {
              final DateTime? selectedDate =
                  await DatePickerCustom().seleccionarFecha(context);
              if (selectedDate != null) {
                registroUsuarioProvider.fechaNacimiento = selectedDate;
              }
            },
            readOnly: true,
            keyboardType: TextInputType.datetime,
            labelColor: Colors.white,
            value:
                registroUsuarioProvider.fechaNacimiento?.longDateTimeString() ??
                    '',
            onChanged: (String value) =>
                registroUsuarioProvider.fechaNacimiento = DateTime.parse(value),
            validator: registroUsuarioProvider.fechaNacimientoValidator),
      ],
    );
  }
}

class _ImagenesDniFormField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registroUsuarioProvider =
        Provider.of<RegistroUsuarioProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Imagen de dni frente',
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: Colors.white)),
        Center(
            child: ImagenDni(
          tipoImagenDni: 'frente',
          imagenDni: registroUsuarioProvider.imagenDniFrente,
          cambiarImagenDni: true,
          onChanged: (value) => registroUsuarioProvider.imagenDniFrente = value,
        )),
        SizedBox(height: SizeConfig.height * 0.015),
        Text('Imagen de dni dorso',
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: Colors.white)),
        Center(
            child: ImagenDni(
          tipoImagenDni: 'dorso',
          imagenDni: registroUsuarioProvider.imagenDniDorso,
          cambiarImagenDni: true,
          onChanged: (value) => registroUsuarioProvider.imagenDniDorso = value,
        )),
      ],
    );
  }
}

class _ItemsPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registroUsuarioProvider =
        Provider.of<RegistroUsuarioProvider>(context);

    final List<Widget> items = [];
    for (var i = 0; i < registroUsuarioProvider.cantidadPages; i++) {
      if (i == registroUsuarioProvider.paginaActual) {
        items.add(Icon(Icons.circle,
            size: SizeConfig.height * 0.02, color: ColorsApp.celesteFondo));
      } else {
        items.add(Icon(Icons.circle,
            size: SizeConfig.height * 0.015, color: Colors.grey));
      }
    }

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: items);
  }
}

class _DeclaracionTerminosCondiciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: "Al registrarme, declaro que soy mayor de edad aceptando los ",
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.white),
          children: [
            TextSpan(
                text: "términos y condiciones ",
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Todo Navegar a los terminos y condiciones
                  },
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.blue[200],
                    decoration: TextDecoration.underline)),
            TextSpan(
                text: " y las ",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.white)),
            TextSpan(
                text: "politicas de privacidad ",
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Todo Navegar a las politicas de privacidad
                  },
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.blue[200],
                    decoration: TextDecoration.underline)),
            TextSpan(
                text: "de Health Safe",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.white))
          ]),
      textAlign: TextAlign.center,
    );
  }
}

class _BotonFinalizar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registroUsuarioProvider =
        Provider.of<RegistroUsuarioProvider>(context);

    final autenticacionService = Provider.of<AutenticacionService>(context);

    return (!autenticacionService.isLoading)
        ? ElevatedButtonCustom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue,
            onPressed: (!registroUsuarioProvider.isLoading)
                ? () => registrarUsuario(context)
                : () {},
            text: 'Finalizar')
        : const CircularProgressIndicatorCustom();
  }

  void registrarUsuario(BuildContext context) async {
    final registroUsuarioProvider =
        Provider.of<RegistroUsuarioProvider>(context, listen: false);
    FocusScope.of(context).unfocus();
    if (!registroUsuarioProvider.isValidForm()) return;

    final autenticacionSevice =
        Provider.of<AutenticacionService>(context, listen: false);

    await autenticacionSevice
        .registroUsuario()
        .then((resp) =>
            Navigator.of(context).pushReplacementNamed(HomePage.routeName))
        .onError((error, stackTrace) {});
  }
}
*/