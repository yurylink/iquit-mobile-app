import 'package:flutter/material.dart';

enum GlobalColors {
  DARK_GREY,
  GREY,
  LIGHT_GREY,
}

extension GlobalColorsNames on GlobalColors{

  static const colors = {
    GlobalColors.DARK_GREY: Color.fromRGBO(46, 46, 46, 1),
    GlobalColors.GREY: Color.fromRGBO(73, 73, 73, 1),
    GlobalColors.LIGHT_GREY: Color.fromRGBO(158, 158, 158, 1)
  };

  Color get color => colors[this];
}