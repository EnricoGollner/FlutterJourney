import 'package:flutter/material.dart';
import 'package:login_app/app/data/http/http_client.dart';
import 'package:login_app/app/data/repositories/users_repository.dart';
import 'package:login_app/app/pages/list_users_page/store/users_store.dart';

class ListUsers extends StatefulWidget {
  const ListUsers({super.key, required this.title});

  final String title;

  @override
  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  final UsersStore usersStore = UsersStore(
    repository: UsersRepository(
      client: HttpClient(),
    ),
  );

  @override
  void initState() {
    super.initState();
    usersStore.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: AnimatedBuilder(
        animation: Listenable.merge(
            [usersStore.isLoading, usersStore.state, usersStore.erro]),
        builder: (context, child) {
          if (usersStore.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (usersStore.erro.value.isNotEmpty) {
            return Center(
              child: Text(
                usersStore.erro.value,
                style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            );
          }

          if (usersStore.state.value.isEmpty) {
            return const Center(
              child: Text('Users não encontrados'),
            );
          } else {
            return ListView.builder(
              itemCount: usersStore.state.value.length,
              itemBuilder: (context, index) {
                final currentUser = usersStore.state.value[index];

                return Column(
                  children: [
                    ListTile(
                      title: Text(currentUser.name),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
