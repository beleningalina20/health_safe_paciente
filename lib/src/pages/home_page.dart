import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'HomePage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(); /*SafeArea(
      child: Scaffold(
        appBar: const AppbarCustom(),
        body: Padding(
          padding: EdgeInsets.all(SizeConfig.height * 0.02),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const LogoHealthSafe(textColor: Colors.black),
              SizedBox(height: SizeConfig.height * 0.1),
              ElevatedButtonCustom(
                onPressed: () {},
                text: 'Sacar turno',
                backgroundColor: ColorsApp.azulBusqueda,
              ),
              SizedBox(height: SizeConfig.height * 0.03),
              ElevatedButtonCustom(
                  onPressed: () {},
                  text: 'Solicitar asistencia inmediata',
                  backgroundColor: ColorsApp.rojoAsistenciaInmediata),
            ],
          )),
        ),
        drawer: const DrawerCustom(),
      ),
    );*/
  }
}
