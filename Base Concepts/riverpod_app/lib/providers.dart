import 'package:flutter_riverpod/flutter_riverpod.dart';

final nomeProvider = Provider.autoDispose((ref) {
  print('nomeProvider: Criado');
  return 'Enrico Gollner';
});

final cursoProvider = Provider((ref) {
  print('curso criado');

  ref.onAddListener(() {
    // Novo listenner sendo criado
    print('Curso provider: novo listenner');
  });

  ref.onRemoveListener(() {
    print('Curso provider: listenner removido');
  });

  ref.onDispose(() {
    // listenner eliminado
    print('Curso provider: descartado');
  });

  return 'Academia do Flutter';
});
