// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_intro_app/model/client.dart';

abstract class ClientState {
  List<Client> clients;

  ClientState({
    required this.clients,
  });
}

class ClientInitialState extends ClientState {
  ClientInitialState() : super(clients: []);
}

class ClientLoadingState extends ClientState {
  ClientLoadingState({required super.clients});
}

class ClientFailureState extends ClientState {
  ClientFailureState({required super.clients});
}

class ClientSuccessState extends ClientState {
  ClientSuccessState({required super.clients});
}