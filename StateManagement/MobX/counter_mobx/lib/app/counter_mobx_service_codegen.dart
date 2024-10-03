// Store class utilizado com Flutter Build Runner - Code Gen (Utilizado com o package mobx_codegen, que pode ser adicionado no dev_dependencies)
// Executar build_runner: dart run build_runner build (ou flutter pub run build_runner watch)
import 'package:mobx/mobx.dart';

//Include generated file
part 'counter_mobx_service_codegen.g.dart';

// ignore: library_private_types_in_public_api
class CounterMobXStoreCodeGen = _CounterMobXStore with _$CounterMobXStoreCodeGen;

abstract class _CounterMobXStore with Store {
  @observable
  int counter = 0;

  @action
  void incrementAction() {
    counter++;
  }
}