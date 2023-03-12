import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:health_safe_paciente/src/pages/pages.dart';
import 'package:health_safe_paciente/src/services/services.dart';
import 'package:health_safe_paciente/src/services/utils/services_status.dart';
import 'package:health_safe_paciente/src/providers/providers.dart';
import 'package:health_safe_paciente/src/theme/size_config.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = "LoginPage";
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsApp.azulLogin,
        body: Padding(
          padding: EdgeInsets.all(Dimens.padding20),
          child: LayoutBuilder(
            builder: (context, constraint) => SingleChildScrollView(
              // https://github.com/flutter/flutter/issues/18711
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: constraint.maxWidth,
                    minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(children: <Widget>[
                    const LogoHealthSafe(),
                    Expanded(
                      child: ChangeNotifierProvider(
                          create: (_) => LoginFormProvider(),
                          child: const _LoginForm()),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: const _RegistroUsuarioPage(),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final loginFormProvider = Provider.of<LoginFormProvider>(context);
    final autenticacionService = Provider.of<AutenticacionService>(context);

    return Form(
        key: loginFormProvider.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            EmailTextFormField(
              onChanged: (String value) => loginFormProvider.correo = value,
            ),
            SizedBox(height: Dimens.padding30),
            ContrasenaTextFormField(
              value: loginFormProvider.contrasena,
              onChanged: (String value) => loginFormProvider.contrasena = value,
            ),
            (autenticacionService.loginStatus?.status == Status.LOADING)
                ? Padding(
                    padding: EdgeInsets.all(Dimens.padding40),
                    child: const Center(child: CircularProgressIndicator()),
                  )
                : ElevatedButtonCustom(
                    margin: EdgeInsets.only(top: Dimens.padding40),
                    text: 'Iniciar sesión',
                    onPressed: (loginFormProvider.isValidForm())
                        ? () async {
                            FocusScope.of(context).unfocus();

                            await login(
                              context,
                              autenticacionService,
                              loginFormProvider.correo,
                              loginFormProvider.contrasena,
                            );
                          }
                        : null,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                  )
          ],
        ));
  }

  Future<void> login(BuildContext context, AutenticacionService service,
      String correo, String contrasena) async {
    await service.login(correo, contrasena).then((value) {
      switch (service.loginStatus?.status) {
        case Status.COMPLETED:
          Navigator.of(context).pushReplacementNamed(HomePage.routeName);
          break;

        case Status.ERROR:
          showDialogCustom(context, [
            const DescriptionText(
                text: "El correo y/o contraseña son incorrectos.",
                textAlign: TextAlign.center),
          ]);
          break;
        default:
      }
    });
  }
}

class _RegistroUsuarioPage extends StatelessWidget {
  const _RegistroUsuarioPage();

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      const DescriptionText(
          text: "¿No tienes cuenta aún?", color: Colors.white),
      TextButtonCustom(
          child: const Text("Registraté"),
          onPressed: () =>
              Navigator.of(context).pushNamed(RegistroUsuarioPage.routeName))
    ]);
  }
}
