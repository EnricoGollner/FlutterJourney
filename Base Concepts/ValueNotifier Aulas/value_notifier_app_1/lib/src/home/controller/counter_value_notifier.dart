import 'package:flutter/material.dart';

///Padronização do ValueNotifier
class Counter extends ValueNotifier<int> {
  Counter() : super(0);

  void increment() => value++;
  void decrement() => value--;
}