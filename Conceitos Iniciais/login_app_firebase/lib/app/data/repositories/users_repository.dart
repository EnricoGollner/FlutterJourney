import 'dart:convert';

import 'package:http/http.dart';
import 'package:login_app/app/data/http/exceptions.dart';
import 'package:login_app/app/data/http/http_client.dart';

import '../models/users_model.dart';

abstract class IUsersRepository {
  Future<List<UsersModel>> getUsers();
}

class UsersRepository implements IUsersRepository {
  final IHttpClient client;

  UsersRepository({required this.client});

  @override
  Future<List<UsersModel>> getUsers() async {
    final Response response =
        await client.get(url: 'https://dummyjson.com/users');

    if (response.statusCode == 200) {
      final List<UsersModel> listOfUsers = [];

      final body = jsonDecode(response.body);

      body['users'].map((oUser) {
        final user = UsersModel.fromMap(oUser);

        listOfUsers.add(user);
      }).toList();
      return listOfUsers;
    } else if (response.statusCode == 404) {
      throw NotFoundException(message: 'Nenhum usuário foi encontrado.');
    } else {
      throw Exception(
          'Não foi possível realizar a requisição. Confira novamente a URL');
    }
  }
}
