import 'package:bloc_intro_app/model/client.dart';

class ClientRepository {
  final List<Client> _clients = [];

  List<Client> loadClients() {
    _clients.addAll([
      Client(name: 'Sundar Pichai'),
      Client(name: 'Mark Zuckerberg'),
      Client(name: 'Crag Federighi'),
    ]);

    return _clients;
  }

  List<Client> addClient(Client client) {
    _clients.add(client);
    return _clients;
  }

  List<Client> removeClient(Client client) {
    _clients.remove(client);
    return _clients;
  }
}