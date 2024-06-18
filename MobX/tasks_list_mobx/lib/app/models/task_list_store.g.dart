// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskListStore on _TaskListStore, Store {
  Computed<List<TaskStore>>? _$tasksListComputed;

  @override
  List<TaskStore> get tasksList =>
      (_$tasksListComputed ??= Computed<List<TaskStore>>(() => super.tasksList,
              name: '_TaskListStore.tasksList'))
          .value;

  late final _$_TaskListStoreActionController =
      ActionController(name: '_TaskListStore', context: context);

  @override
  void updateFilter(bool showOnlyNotConcluded) {
    final _$actionInfo = _$_TaskListStoreActionController.startAction(
        name: '_TaskListStore.updateFilter');
    try {
      return super.updateFilter(showOnlyNotConcluded);
    } finally {
      _$_TaskListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTask(String description) {
    final _$actionInfo = _$_TaskListStoreActionController.startAction(
        name: '_TaskListStore.addTask');
    try {
      return super.addTask(description);
    } finally {
      _$_TaskListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTask(String id, String newDescription, bool isConcludedChange) {
    final _$actionInfo = _$_TaskListStoreActionController.startAction(
        name: '_TaskListStore.updateTask');
    try {
      return super.updateTask(id, newDescription, isConcludedChange);
    } finally {
      _$_TaskListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteTask(String id) {
    final _$actionInfo = _$_TaskListStoreActionController.startAction(
        name: '_TaskListStore.deleteTask');
    try {
      return super.deleteTask(id);
    } finally {
      _$_TaskListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasksList: ${tasksList}
    ''';
  }
}
