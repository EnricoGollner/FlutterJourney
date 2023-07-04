import 'package:flutter/material.dart';
import 'package:login_app/app/data/http/exceptions.dart';
import 'package:login_app/app/data/models/users_model.dart';
import 'package:login_app/app/data/repositories/users_repository.dart';

class UsersStore {
  final IUsersRepository repository;

  UsersStore({required this.repository});

  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  final ValueNotifier<List<UsersModel>> state = ValueNotifier([]);

  final ValueNotifier<String> erro = ValueNotifier('');

  Future getUsers() async {
    isLoading.value = true;

    try {
      final result = await repository.getUsers();
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    }

    isLoading.value = false;
  }
}
