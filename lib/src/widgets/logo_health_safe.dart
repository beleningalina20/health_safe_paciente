import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/widgets/widgets.dart';

class LogoHealthSafe extends StatelessWidget {
  final Color textColor;
  final String subtitle;
  const LogoHealthSafe(
      {Key? key,
      this.textColor = Colors.white,
      this.subtitle = 'Estamos aquí para cuidarte'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: Dimens.padding30),
        child: Column(children: <Widget>[
          TitleText(text: '¡Bienvenido a Health Safe!', color: textColor),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Dimens.padding20),
            child: Image(
                image: const AssetImage('assets/images/logo_health_safe.png'),
                height: SizeConfig.height * 0.25),
          ),
          SubtitleText(
            text: subtitle,
            color: textColor,
            textAlign: TextAlign.center,
          )
        ]));
  }
}
