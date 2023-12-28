import 'dart:async';

import 'package:bloc_intro_app/blocs/client_event.dart';
import 'package:bloc_intro_app/blocs/client_state.dart';
import 'package:bloc_intro_app/model/client.dart';
import 'package:bloc_intro_app/repositories/client_repository.dart';

class ClientBloc {
  final _clientRepository = ClientRepository();

  final StreamController<ClientEvent> _inputClientController = StreamController<ClientEvent>();
  final StreamController<ClientState> _outputClientController = StreamController<ClientState>();

  Sink<ClientEvent> get inputClient => _inputClientController.sink;
  Stream<ClientState> get streamClient => _outputClientController.stream;

  ClientBloc() {
    _inputClientController.stream.listen(_mapEventToState);
  }

  Future<void> _mapEventToState(ClientEvent event) async {
    List<Client> clients = [];
    _outputClientController.add(ClientLoadingState(clients: []));

    if (event is LoadClientEvent) {
      clients = _clientRepository.loadClients();
    } else if (event is AddClientEvent) {
      clients = _clientRepository.addClient(event.client);
    } else if (event is RemoveClientEvent) {
      clients = _clientRepository.removeClient(event.client);
    }

    _outputClientController.add(ClientSuccessState(clients: clients));
  }
}
