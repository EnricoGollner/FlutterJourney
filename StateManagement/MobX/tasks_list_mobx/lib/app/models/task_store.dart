import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'task_store.g.dart';

class TaskStore = _TaskStore with _$TaskStore;

abstract class _TaskStore with Store {
  String id = UniqueKey().toString();
  @observable
  String description = '';
  @observable
  bool isConcluded = false;

  _TaskStore(this.description, this.isConcluded);

  @action
  void updateTask(String newDescription, bool isConcludedChange) {
    description = newDescription;
    isConcluded = isConcludedChange;
  }
}