import 'package:flutter/material.dart';
import 'package:getit_core_resources/getit_core_resources.dart';

ThemeData createAppTheme({
  bool dark = false,
}) {
  final mainColor = dark ? Color(0xFF527DBC) : Color(0xFF417169);
  final theme = ThemeData(
    primarySwatch: createMaterialColor(mainColor),
    primaryColor: mainColor,
    useMaterial3: true,
    brightness: dark ? Brightness.dark : Brightness.light,
    toggleableActiveColor: mainColor,
    buttonTheme: kButtonTheme,
    dividerTheme: DividerThemeData(space: 0),
    errorColor: Color(0xFFE3000F),
    inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder()),
  );

  final secondaryColor = mainColor;
  return theme.copyWith(
    // ignore: deprecated_member_use
    accentColor: secondaryColor,
    colorScheme: theme.colorScheme.copyWith(
      secondary: secondaryColor,
      onSecondary: secondaryColor.brightness == Brightness.light ? Colors.black : Colors.white,
    ),
  );
}

final kButtonTheme = ButtonThemeData(
  textTheme: ButtonTextTheme.primary,
  height: ButtonThemeData().height * 1.25,
);
