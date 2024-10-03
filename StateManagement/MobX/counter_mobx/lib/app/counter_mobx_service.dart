
import 'package:mobx/mobx.dart';

class CounterMobXService {
  final Observable<int> _counter = Observable(0);
  int get counter => _counter.value;
  
  late Action incrementAction;
  set counter(int newValue) => _counter.value = newValue;

  void _increment() {
    _counter.value++;
  }

  CounterMobXService() {
    incrementAction = Action(_increment);  // Transformando a função em uma action que altera o valor do observable
    //e gera a reação, que é o Widget que está observando alterações atualizar
  }
}
