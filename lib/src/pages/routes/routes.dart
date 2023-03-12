import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/pages/busqueda_profesionales_page.dart';
import 'package:health_safe_paciente/src/pages/pages.dart';

Map<String, WidgetBuilder> getApplicationRoutes() => <String, WidgetBuilder>{
      LoginPage.routeName: (_) => const LoginPage(),
      RegistroUsuarioPage.routeName: (_) => const RegistroUsuarioPage(),
      HomePage.routeName: (_) => const HomePage(),
      BusquedaProfesionalesPage.routeName: (_) =>
          const BusquedaProfesionalesPage(),
    };
