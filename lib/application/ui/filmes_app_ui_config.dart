import 'package:flutter/material.dart';

class FilmesAppUiConfig {
  FilmesAppUiConfig._();
  static String get title => "Filmes APP";
  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Metropolis",
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: TextStyle(
            color: Color(0xff222222),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}
