import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';

extension TextExtensions on TitleText {
  Row withPrefixIcon(IconData prefixIcon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: EdgeInsets.only(right: Dimens.padding20),
            child:
                Icon(prefixIcon, color: Colors.white, size: Dimens.iconSize70)),
        this
      ],
    );
  }
}

class TitleText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign textAlign;
  final IconData? prefixIcon;
  final FontWeight fontWeight;

  const TitleText(
      {super.key,
      required this.text,
      this.color = Colors.black,
      this.textAlign = TextAlign.start,
      this.prefixIcon,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: Dimens.fontSize35, color: color, fontWeight: fontWeight),
      textAlign: textAlign,
    );
  }
}

class SubtitleText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final IconData? prefixIcon;

  const SubtitleText(
      {super.key,
      required this.text,
      this.color = Colors.black,
      this.textAlign = TextAlign.start,
      this.fontWeight = FontWeight.normal,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: Dimens.fontSize30,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}

class BodyText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign textAlign;

  const BodyText(
      {super.key,
      required this.text,
      this.color = Colors.black,
      this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontSize: Dimens.fontSize25,
          color: color,
        ),
        textAlign: textAlign);
  }
}

class DescriptionText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign textAlign;
  final FontWeight? fontWeight;

  const DescriptionText(
      {super.key,
      required this.text,
      this.color = Colors.black,
      this.textAlign = TextAlign.start,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: Dimens.fontSize20, color: color, fontWeight: fontWeight),
    );
  }
}
