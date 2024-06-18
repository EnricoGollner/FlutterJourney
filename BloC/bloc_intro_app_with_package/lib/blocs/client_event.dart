
import 'package:bloc_intro_app_with_package_with_package/model/client.dart';

abstract class ClientEvent {}

class LoadClientEvent extends ClientEvent {}

class AddClientEvent extends ClientEvent {
  final Client client;
  
  AddClientEvent({required this.client});
}

class RemoveClientEvent extends ClientEvent {
  final Client client;
  
  RemoveClientEvent({required this.client});
}