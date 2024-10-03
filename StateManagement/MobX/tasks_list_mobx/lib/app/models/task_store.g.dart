// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskStore on _TaskStore, Store {
  late final _$descriptionAtom =
      Atom(name: '_TaskStore.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$isConcludedAtom =
      Atom(name: '_TaskStore.isConcluded', context: context);

  @override
  bool get isConcluded {
    _$isConcludedAtom.reportRead();
    return super.isConcluded;
  }

  @override
  set isConcluded(bool value) {
    _$isConcludedAtom.reportWrite(value, super.isConcluded, () {
      super.isConcluded = value;
    });
  }

  late final _$_TaskStoreActionController =
      ActionController(name: '_TaskStore', context: context);

  @override
  void updateTask(String newDescription, bool isConcludedChange) {
    final _$actionInfo =
        _$_TaskStoreActionController.startAction(name: '_TaskStore.updateTask');
    try {
      return super.updateTask(newDescription, isConcludedChange);
    } finally {
      _$_TaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
description: ${description},
isConcluded: ${isConcluded}
    ''';
  }
}
