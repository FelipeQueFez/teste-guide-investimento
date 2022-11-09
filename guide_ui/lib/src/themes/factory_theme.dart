import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'factory_colors.dart';

ThemeData factoryTheme(BuildContext context, String fontFamily) {
  return ThemeData(
    fontFamily: fontFamily,
    disabledColor: FactoryColors().get().disabledColor,
    appBarTheme: AppBarTheme(
      color: FactoryColors().get().primary,
      iconTheme: IconThemeData(
        color: FactoryColors().get().secundary,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    iconTheme: IconThemeData(
      size: 18.0,
    ),
    hintColor: FactoryColors().get().hintColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: FactoryColors().get().primary,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: FactoryColors().get().secundary,
    ),
    primaryColor: FactoryColors().get().primary,
    backgroundColor: FactoryColors().get().secundary,
    textTheme: TextTheme(
      headline5: TextStyle(),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: FactoryColors().get().primary,
          width: 1.5,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: FactoryColors().get().primary,
          width: 1.5,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: FactoryColors().get().primary,
          width: 1.5,
        ),
      ),
    ),
  );
}
