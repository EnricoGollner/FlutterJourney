import 'package:flutter/material.dart';

class Task {
  String id = UniqueKey().toString();
  String description = '';
  bool isConcluded = false;

  Task(this.description, this.isConcluded);

  void updateTask(String newDescription, bool isConcludedChange) {
    description = newDescription;
    isConcluded = isConcludedChange;
  }
}