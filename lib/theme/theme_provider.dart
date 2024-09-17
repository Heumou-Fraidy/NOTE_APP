import 'package:first_flutter_project/theme/theme.dart';
import 'package:flutter/material.dart';
//import 'package:isarcrudtute/theme/theme.dart';

class ThemeProvider with ChangeNotifier {

  // initialize light mode
  ThemeData _themeData = lightMode;

  //initialize dark mode
  ThemeData get themeData => _themeData; 

  //GETTER METHOD TO SEE IF WE ARE IN DARK MODE OR NOT
  bool get isDarkMode => _themeData == darkMode;
  set themeData(ThemeData themeData) {


  _themeData = themeData;
    notifyListeners();
  }
//we will use this to switch the mode

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}