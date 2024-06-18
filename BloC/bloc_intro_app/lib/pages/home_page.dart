import 'dart:math';

import 'package:bloc_intro_app/blocs/client_bloc.dart';
import 'package:bloc_intro_app/blocs/client_event.dart';
import 'package:bloc_intro_app/blocs/client_state.dart';
import 'package:bloc_intro_app/model/client.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ClientBloc _bloc;

  @override
  void initState() {
    _bloc = ClientBloc();
    _bloc.inputClient.add(LoadClientEvent());

    super.initState();
  }

  @override
  void dispose() {
    _bloc.inputClient.close();
    super.dispose();
  }

  String _randomName()  {
    final random = Random();
    final List<String> namesList = ['Jeff Bezos', 'Elon Musk', 'Akira Nakai', ''];

    return namesList.elementAt(random.nextInt(namesList.length - 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clients'),
        actions: [
          IconButton(
            onPressed: () {
              _bloc.inputClient.add(AddClientEvent(client: Client(name: _randomName())));
            },
            icon: const Icon(Icons.person_add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: StreamBuilder<ClientState>(
            stream: _bloc.streamClient,
            builder: (context, AsyncSnapshot<ClientState> snapshot) {
              final List<Client> clientsList = snapshot.data?.clients ?? [];

              return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: clientsList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text( clientsList[index].name.substring(0, 1)),
                      ),
                      title: Text(clientsList[index].name),
                      trailing: IconButton(
                        onPressed: () {
                          _bloc.inputClient.add(RemoveClientEvent(client: clientsList[index]));
                        },
                        icon: const Icon(Icons.minimize),
                      )
                    );
                  });
            }),
      ),
    );
  }
}
