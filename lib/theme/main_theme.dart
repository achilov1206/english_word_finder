import 'package:flutter/material.dart';

// ThemeData mainThemeData(Color? color) {
//   if (color != null) {
//     return ThemeData(primarySwatch: MaterialColor(color.value, {}));
//   } else {
//     return ThemeData(primarySwatch: Colors.purple);
//   }

//   //return ThemeData(primaryColor: color ?? Colors.purple);
// }

class MyTheme {
  Brightness brightness;
  MaterialColor primarySwatch;
  MyTheme({
    required this.brightness,
    required this.primarySwatch,
  });

  static buildThemeData(AppTheme appTheme) {
    return ThemeData(
      brightness: appTheme.theme.brightness,
      primarySwatch: appTheme.theme.primarySwatch,
    );
  }

  static List<Color> getColorsList(Map<String, AppTheme> themes) {
    List<Color> myColorList = [];
    themes.forEach((key, value) {
      myColorList.add(value.theme.primarySwatch);
    });
    return myColorList;
  }

  static String colorToThemeName(Color color) {
    if (color == Colors.teal) {
      return 'teal';
    } else if (color == Colors.orange) {
      return 'orange';
    } else if (color == Colors.green) {
      return 'green';
    } else if (color == Colors.blue) {
      return 'blue';
    } else if (color == Colors.indigo) {
      return 'indigo';
    } else {
      return 'default';
    }
  }
}

class AppTheme {
  String name;
  MyTheme theme;
  AppTheme(this.name, this.theme);
}

Map<String, AppTheme> myThemes = {
  'default': AppTheme(
    'Default',
    MyTheme(
      brightness: Brightness.light,
      primarySwatch: Colors.purple,
    ),
  ),
  'teal': AppTheme(
    'Teal',
    MyTheme(
      brightness: Brightness.light,
      primarySwatch: Colors.teal,
    ),
  ),
  'orange': AppTheme(
    'Orange',
    MyTheme(
      brightness: Brightness.light,
      primarySwatch: Colors.orange,
    ),
  ),
  'green': AppTheme(
    'Green',
    MyTheme(
      brightness: Brightness.light,
      primarySwatch: Colors.green,
    ),
  ),
  'blue': AppTheme(
    'Blue',
    MyTheme(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
    ),
  ),
  'indigo': AppTheme(
    'Indigo',
    MyTheme(
      brightness: Brightness.light,
      primarySwatch: Colors.indigo,
    ),
  ),
};
