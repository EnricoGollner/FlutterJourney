import 'package:flutter/material.dart';

class HomeControllerValueNotifier {
  final ValueNotifier<int> counter$ = ValueNotifier<int>(0);
  final ValueNotifier<bool> loading$ = ValueNotifier<bool>(true);
  
  int get counter => counter$.value;

  ///Method to increment the counter value
  void increment() {
    counter$.value++;
  }
}