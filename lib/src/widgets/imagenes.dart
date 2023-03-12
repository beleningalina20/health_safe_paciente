import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:health_safe_paciente/src/theme/size_config.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/widgets/widgets.dart';

class CircleAvatarImagenPerfil extends StatelessWidget {
  final double radius;
  final ImageProvider<Object>? image;

  const CircleAvatarImagenPerfil(
      {super.key, required this.radius, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimens.padding20),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: image,
        // child: const Text("BI"),
        // foregroundColor: Colors.blue,
        // foregroundImage: const AssetImage('assets/imgs/logo_health_safe.png'),
        // key: ,
        // maxRadius: , No se lo define si se define el radius
        // minRadius: ,
        /*onBackgroundImageError: (exception, stackTrace) {
          print(exception);
        },
        onForegroundImageError: (exception, stackTrace) {
          print(exception);
        },*/
        radius: radius,
      ),
    );
  }
}

class ImagenPerfil extends StatelessWidget {
  final File? imagenPerfil;
  final Color? labelColor;
  final void Function(File) onChanged;

  const ImagenPerfil(
      {super.key,
      required this.onChanged,
      required this.imagenPerfil,
      this.labelColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DescriptionText(
            text: 'Imagen de perfil', color: labelColor ?? Colors.white),
        SizedBox(height: Dimens.padding10),
        Center(
          child: Stack(clipBehavior: Clip.none, children: <Widget>[
            CircleAvatar(
                backgroundImage: (imagenPerfil != null)
                    ? FileImage(imagenPerfil!)
                    : const AssetImage('assets/imgs/no-person.png')
                        as ImageProvider<Object>?,
                radius: Dimens.circleAvatarRadius100),
            Positioned(
                top: SizeConfig.height * 0.15,
                left: SizeConfig.width * 0.3,
                child: CircleAvatar(
                    backgroundColor: ColorsApp.azulBusqueda,
                    radius: Dimens.circleAvatarRadius30,
                    child: IconButton(
                        onPressed: () => seleccionImagen(context, onChanged),
                        icon:
                            const Icon(Icons.camera_alt, color: Colors.white))))
          ]),
        ),
      ],
    );
  }
}

class ImagenDni extends StatelessWidget {
  final File? imagenDni;
  final AssetImage imagenPlaceholder;
  final void Function(File) onChanged;
  final String label;
  final Color? labelColor;

  const ImagenDni(
      {super.key,
      required this.imagenDni,
      required this.imagenPlaceholder,
      required this.onChanged,
      required this.label,
      this.labelColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DescriptionText(text: label, color: labelColor ?? Colors.white),
        SizedBox(height: Dimens.padding10),
        Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                  borderRadius:
                      BorderRadius.circular(Dimens.roundedCornerRadius20),
                  child: Image(
                    image: (imagenDni != null)
                        ? FileImage(imagenDni!)
                        : imagenPlaceholder as ImageProvider<Object>,
                    fit: BoxFit.cover,
                    height: SizeConfig.height * 0.25,
                    width: double.infinity,
                  )),
              Positioned(
                  top: SizeConfig.height * 0.21,
                  left: SizeConfig.height * 0.37,
                  child: CircleAvatar(
                      backgroundColor: ColorsApp.azulBusqueda,
                      radius: Dimens.circleAvatarRadius30,
                      child: IconButton(
                          onPressed: () => seleccionImagen(context, onChanged),
                          icon: const Icon(Icons.camera_alt,
                              color: Colors.white)))),
            ],
          ),
        ),
      ],
    );
  }
}

void seleccionImagen(BuildContext context, void Function(File) onChanged) {
  showDialogCustom(context, [
    const DescriptionText(text: "Seleccione su foto de perfil"),
    const Divider(),
    TextButton.icon(
        onPressed: () async {
          Navigator.pop(context);
          await _pickImage(context, ImageSource.camera, onChanged);
        },
        icon: const Icon(Icons.camera_alt),
        label: const Text("Abrir cámara")),
    const Divider(),
    TextButton.icon(
        onPressed: () async {
          Navigator.pop(context);
          await _pickImage(context, ImageSource.gallery, onChanged);
        },
        icon: const Icon(Icons.image),
        label: const Text("Abrir galería de fotos"))
  ]);
}

Future<void> _pickImage(BuildContext context, ImageSource source,
    void Function(File) onChanged) async {
  ImagePicker imagePicker = ImagePicker();
  var image = await imagePicker.pickImage(source: source);
  if (image != null) {
    onChanged(File(image.path));
  }
}
