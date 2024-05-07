import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _name = '';
  static bool _isDarkMode = false;
  static int _typeUser = 1;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get name => _prefs.getString('name') ?? _name;
  static set name(String value) {
    _name = value;
    _prefs.setString('name', value);
  }

  static bool get isDarkMode => _prefs.getBool('isDarkMode') ?? _isDarkMode;
  static set isDarkMode(bool value) {
    _isDarkMode = value;
    _prefs.setBool('isDarkMode', value);
  }

  static int get typeUser => _prefs.getInt('typeUser') ?? _typeUser;
  static set typeUser(int value) {
    _typeUser = value;
    _prefs.setInt('typeUser', value);
  }
}
