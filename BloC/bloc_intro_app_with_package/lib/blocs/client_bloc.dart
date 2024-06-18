import 'package:bloc/bloc.dart';
import 'package:bloc_intro_app_with_package_with_package/blocs/client_event.dart';
import 'package:bloc_intro_app_with_package_with_package/blocs/client_state.dart';
import 'package:bloc_intro_app_with_package_with_package/repositories/client_repository.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  final _clientRepository = ClientRepository();

  ClientBloc() : super(ClientInitialState()) {
    on<LoadClientEvent>(
      (event, emit) => emit(ClientSuccessState(clients: _clientRepository.loadClients())),
    );

    on<AddClientEvent>(
      (event, emit) => emit(ClientSuccessState(clients: _clientRepository.addClient(event.client))),
    );
    
    on<RemoveClientEvent>(
      (event, emit) => emit(ClientSuccessState(clients: _clientRepository.removeClient(event.client)))
    );
  }
}
