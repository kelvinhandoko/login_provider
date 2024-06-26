import 'package:flutter/cupertino.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  void changeTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
