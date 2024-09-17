import 'package:flutter/material.dart';

//light mode
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade300,
    primary: const Color.fromARGB(255, 136, 198, 226),
    secondary: Colors.grey.shade400,
    inversePrimary: const Color.fromARGB(255, 29, 28, 28),
  ),
);


//dark mode
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: const Color.fromARGB(255, 0, 0, 0),
    primary: const Color.fromARGB(255, 62, 62, 62),
    secondary: const Color.fromARGB(255, 34, 34, 34),
    inversePrimary: Colors.grey.shade300,
  ),
);