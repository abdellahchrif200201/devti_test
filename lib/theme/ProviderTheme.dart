import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  final ThemeData _lightTheme = _buildTheme(false);
  final ThemeData _darkTheme = _buildTheme(true);

  ThemeData get currentTheme => _darkMode ? _darkTheme : _lightTheme;

  bool _darkMode = false;
  bool get darkMode => _darkMode;

  // String _timeZone = 'GMT+1';
  // String get timeZone => _timeZone;

  void setDarkMode(bool value) {
    if (_darkMode != value) {
      _darkMode = value;
      _saveDarkMode();
      notifyListeners();
    }
  }

  Future<void> loadDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _darkMode = prefs.getBool("darkMode") ?? false;
    notifyListeners();
  }

  Future<void> _saveDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', _darkMode);
  }

  static ThemeData _buildTheme(bool isDarkMode) {
    return ThemeData(
      useMaterial3: true,
      iconTheme: IconThemeData(
        color: isDarkMode ? Colors.white : Colors.black,
      ),
      cardColor: isDarkMode ? const Color(0xFF5B2C6F) : Colors.orange,
      primaryColor: isDarkMode
          ? const Color(0xFF1f1b24)
          : const Color.fromARGB(255, 245, 243, 243),
      backgroundColor: isDarkMode ? Colors.black : const Color(0xffffffff),
      textTheme: TextTheme(
        bodyText1: TextStyle(
            color: isDarkMode ? Colors.white : const Color(0xff1C2833),
            fontSize: 14),
        bodyText2: TextStyle(
            color: isDarkMode ? const Color(0xff1C2833) : Colors.white,
            fontSize: 11),
        headline1: TextStyle(
            color: isDarkMode
                ? Color.fromARGB(227, 242, 242, 242)
                : const Color.fromARGB(159, 0, 0, 0),
            fontSize: 15),
        headline2: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
