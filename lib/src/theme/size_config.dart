import 'package:flutter/material.dart';

class SizeConfig {
  // https://dev.to/ushieru/responsive-in-flutter-5dil
  static double width = 0;
  static double height = 0;

  SizeConfig(BuildContext context) {
    var mediaQueryContext = MediaQuery.of(context);

    width = mediaQueryContext.size.width;
    height = mediaQueryContext.size.height;
  }
}
