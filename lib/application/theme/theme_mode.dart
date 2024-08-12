import 'package:flutter/material.dart';

class AppThemeMode extends ChangeNotifier {
  late Brightness _brightness;

  AppThemeMode(BuildContext context) {
    _brightness = View.of(context).platformDispatcher.platformBrightness;
  }

  set brightness(Brightness brightness) {
    _brightness = brightness;
    notifyListeners();
  }

  Brightness get brightness => _brightness;
}
