import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;

  ThemeProvider({required bool isDarkMode})
      : currentTheme = isDarkMode ? ThemeData.dark() : ThemeData.light();

  setLigthMode() {
    currentTheme = ThemeData.light();
    notifyListeners();
  }

  setDardMode() {
    currentTheme = ThemeData.dark();
    notifyListeners();
  }
}
