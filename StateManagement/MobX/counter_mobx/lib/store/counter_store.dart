import 'package:mobx/mobx.dart';

part 'counter_store.g.dart';  // Creating mixin

class CounterStore = _CounterStore with _$CounterStore;

abstract class _CounterStore with Store {
  @observable
  int _counter = 0;
  
  int get counter => _counter;

  @action
  void incrementer() {
    _counter++;
  }
}