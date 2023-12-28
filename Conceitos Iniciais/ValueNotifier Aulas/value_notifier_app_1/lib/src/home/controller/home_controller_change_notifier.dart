import 'package:flutter/material.dart';

class HomeControllerChangeNotifier extends ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }
}