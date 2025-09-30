import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.orange,
  Colors.pink,
  Colors.purple,
  Colors.red,
  Colors.teal,
  Colors.orangeAccent,
  Colors.pinkAccent,
  Colors.purpleAccent,
  Colors.redAccent,
  Colors.tealAccent,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
    : assert(
        selectedColor >= 0,
        'La posición del color seleccionado debe ser mayor o igual a 0',
      ),
      assert(
        selectedColor < colorList.length,
        'La posición del color seleccionado no debe ser superior al tamaño de la lista',
      );

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor]
  );
}
