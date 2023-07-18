import 'package:flutter/material.dart';

class AppController extends ChangeNotifier {
  // Design Pattern chamado Singlaton - Quando criamos uma classe estática dela mesmo e instanciamos ela mesmo.
  static AppController instance = AppController();

  bool isDarkTheme = false;

  changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners(); // que notifica a mudança a quem está escutando (que vai refazer o build)
  }
}
