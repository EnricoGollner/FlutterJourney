import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_app/app/people/data/model/person.dart';
import 'package:hive_app/app/people/data/repositories/people_repository.dart';

class PeopleController extends ValueNotifier<List<Person>> {
  PeopleController() : super([]);

  Future<void> getPeople() async {
    final PeopleRepository repository = await PeopleRepository.load();
    value = await repository.getList();
  }

  Future<void> addPerson(String personName) async {
    final PeopleRepository repository = await PeopleRepository.load();

    final Person person = Person(name: personName, age: Random().nextInt(40));

    value.add(person);
    await repository.save(value);
    notifyListeners();
  }
}
