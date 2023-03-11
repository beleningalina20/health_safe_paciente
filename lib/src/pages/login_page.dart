import 'package:flutter/material.dart';

import 'package:health_safe_paciente/src/theme/themes.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = 'LoginPage';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig(context); // TODO pasar a LoadingPage

    return Container() /*SafeArea(
        child: Scaffold(
            backgroundColor: ColorsApp.azulLogin,
            body: Padding(
              padding: EdgeInsets.all(SizeConfig.height * 0.02),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    const LogoHealthSafe(),
                    ChangeNotifierProvider(
                        create: (_) => LoginProvider(), child: _FormLogin()),
                    _RegistroUsuarioBoton()
                  ],
                ),
              ),
            )))*/
        ;
  }
}

/*class _FormLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final autenticacionService = Provider.of<AutenticacionService>(context);

    return Container(
      margin: EdgeInsets.symmetric(
          vertical: SizeConfig.height * 0.015,
          horizontal: SizeConfig.height * 0.015),
      child: Form(
        key: loginProvider.formKey,
        child: Column(
          children: [
            TextFormFieldCustom(
              label: 'Correo',
              labelColor: Colors.white,
              keyboardType: TextInputType.emailAddress,
              value: loginProvider.correo,
              onChanged: (value) => loginProvider.correo = value,
            ),
            SizedBox(height: SizeConfig.height * 0.03),
            TextFormFieldCustom(
                label: 'Contraseña',
                labelColor: Colors.white,
                isPassword: true,
                value: loginProvider.contrasena,
                onChanged: (value) => loginProvider.contrasena = value),
            SizedBox(height: SizeConfig.height * 0.03),
            (!autenticacionService.isLoading)
                ? ElevatedButtonCustom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    onPressed: (!loginProvider.isLoading)
                        ? () => loginUsuario(context)
                        : () {},
                    text: 'Iniciar Sesión')
                : const CircularProgressIndicatorCustom()
          ],
        ),
      ),
    );
  }

  void loginUsuario(BuildContext context) async {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    FocusScope.of(context).unfocus();
    if (!loginProvider.isValidForm()) return;

    final autenticacionSevice =
        Provider.of<AutenticacionService>(context, listen: false);

    await autenticacionSevice
        .login(loginProvider.correo, loginProvider.contrasena)
        .then((resp) =>
            Navigator.of(context).pushReplacementNamed(HomePage.routeName))
        .onError((error, stackTrace) {
      // TODO
    });
  }
}

class _RegistroUsuarioBoton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const DisclaimerText(text: '¿No tienes cuenta aún?', color: Colors.white),
      TextButton(
          onPressed: () =>
              Navigator.pushNamed(context, RegistroUsuarioPage.routeName),
          child: const Text('Registrate'))
    ]);
  }
}*/
