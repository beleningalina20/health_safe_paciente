import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/pages/pages.dart';
import 'package:health_safe_paciente/src/pages/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health Safe - Paciente',
      initialRoute: LoginPage.routeName,
      routes: getApplicationRoutes(),
      // theme: ThemeApp.theme
    );
  }
}
