import 'dart:math';

import 'package:bloc_intro_app_with_package_with_package/blocs/client_bloc.dart';
import 'package:bloc_intro_app_with_package_with_package/blocs/client_event.dart';
import 'package:bloc_intro_app_with_package_with_package/blocs/client_state.dart';
import 'package:bloc_intro_app_with_package_with_package/model/client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    _bloc.add(LoadClientEvent());

    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
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
              _bloc.add(AddClientEvent(client: Client(name: _randomName())));
            },
            icon: const Icon(Icons.person_add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: BlocBuilder<ClientBloc, ClientState>(
            bloc: _bloc,
            builder: (context, state) {
              if (state is ClientInitialState || state is ClientLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ClientSuccessState) {
                final List<Client> clientsList = state.clients;
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
                          _bloc.add(RemoveClientEvent(client: clientsList[index]));
                        },
                        icon: const Icon(Icons.minimize),
                      )
                    );
                  });
              } else {
                return const Center(
                  child: Text('Error'),
                );
              }

            }),
      ),
    );
  }
}
