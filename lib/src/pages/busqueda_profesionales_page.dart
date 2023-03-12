import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/providers/providers.dart';
import 'package:health_safe_paciente/src/services/services.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/widgets/widgets.dart';

class BusquedaProfesionalesPage extends StatelessWidget {
  static const String routeName = "BusquedaProfesionalesPage";
  const BusquedaProfesionalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: const AppbarCustom(),
            backgroundColor: ColorsApp.azulBusqueda,
            body: Padding(
                padding: EdgeInsets.all(Dimens.padding20),
                child: Column(
                  children: [
                    const BusquedaProfesionalesTitulo(),
                    ChangeNotifierProvider(
                        create: (_) => BusquedaProfesionalesProvider(),
                        child: const FiltrosBusquedaProfesionales())
                  ],
                )),
            drawer: const DrawerCustom()));
  }
}

class BusquedaProfesionalesTitulo extends StatelessWidget {
  const BusquedaProfesionalesTitulo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      const TitleText(
              text: "SACAR TURNO",
              textAlign: TextAlign.center,
              color: Colors.white,
              fontWeight: FontWeight.bold)
          .withPrefixIcon(Icons.note_alt_outlined),
      Padding(
        padding: EdgeInsets.symmetric(vertical: Dimens.padding20),
        child: const BodyText(
            text:
                'Más de 1000 profesionales están aquí para ayudarte. Encontra a los especialistas de tu ciudad y solicita el turno que más te convenga',
            color: Colors.white,
            textAlign: TextAlign.center),
      )
    ]);
  }
}

class FiltrosBusquedaProfesionales extends StatelessWidget {
  const FiltrosBusquedaProfesionales({super.key});

  @override
  Widget build(BuildContext context) {
    final busquedaProfesionalesProvider =
        Provider.of<BusquedaProfesionalesProvider>(context);

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Filtros(),
          ElevatedButtonCustom(
              text: "Buscar profesionales",
              onPressed: (busquedaProfesionalesProvider.esValidaBusqueda())
                  ? () {
                      // TODO Navegar al listado de profesionales
                    }
                  : null,
              backgroundColor: Colors.white,
              foregroundColor: ColorsApp.azulBusqueda)
        ],
      ),
    );
  }
}

class Filtros extends StatelessWidget {
  const Filtros({super.key});

  @override
  Widget build(BuildContext context) {
    final busquedaProfesionalesProvider =
        Provider.of<BusquedaProfesionalesProvider>(context);

    return Column(
      children: [
        SizedBox(height: Dimens.padding30),
        const ListadoEspecialidades(),
        SizedBox(height: Dimens.padding30),
        const ListadoModalidadesAtencion(),
        SizedBox(height: Dimens.padding30),
        (busquedaProfesionalesProvider.modalidadAtencion?.descripcion ==
                "Presencial")
            ? const ListadoLocalidades()
            : Container()
      ],
    );
  }
}

class ListadoEspecialidades extends StatelessWidget {
  const ListadoEspecialidades({super.key});

  @override
  Widget build(BuildContext context) {
    final busquedaProfesionalesProvider =
        Provider.of<BusquedaProfesionalesProvider>(context);
    return FutureBuilder(
      future: EspecialidadService.especialidadService.especialidades,
      builder:
          (BuildContext context, AsyncSnapshot<List<Especialidad>?> snapshot) {
        if (snapshot.hasData) {
          return DropDownButtonCustom<Especialidad>(
            label: 'Especialidad',
            labelColor: Colors.white,
            items: snapshot.data!,
            value: busquedaProfesionalesProvider.especialidad,
            onChanged: (value) =>
                busquedaProfesionalesProvider.especialidad = value,
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class ListadoModalidadesAtencion extends StatelessWidget {
  const ListadoModalidadesAtencion({super.key});

  @override
  Widget build(BuildContext context) {
    final busquedaProfesionalesProvider =
        Provider.of<BusquedaProfesionalesProvider>(context);

    return FutureBuilder(
      future:
          ModalidadAtencionService.modalidadAtencionService.modalidadesAtencion,
      builder: (BuildContext context,
          AsyncSnapshot<List<ModalidadAtencion>?> snapshot) {
        if (snapshot.hasData) {
          return DropDownButtonCustom<ModalidadAtencion>(
            label: 'Modalidad Atención',
            labelColor: Colors.white,
            items: snapshot.data!,
            value: busquedaProfesionalesProvider.modalidadAtencion,
            onChanged: (value) =>
                busquedaProfesionalesProvider.modalidadAtencion = value,
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class ListadoLocalidades extends StatelessWidget {
  const ListadoLocalidades({super.key});

  @override
  Widget build(BuildContext context) {
    final busquedaProfesionalesProvider =
        Provider.of<BusquedaProfesionalesProvider>(context);

    return FutureBuilder(
      future: LocalidadService.localidadService.localidades,
      builder:
          (BuildContext context, AsyncSnapshot<List<Localidad>?> snapshot) {
        if (snapshot.hasData) {
          return DropDownButtonCustom<Localidad>(
            label: 'Ciudad',
            labelColor: Colors.white,
            items: snapshot.data!,
            value: busquedaProfesionalesProvider.ciudad,
            onChanged: (value) => busquedaProfesionalesProvider.ciudad = value,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
