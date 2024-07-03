
import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String description = '';
  bool isConcluded = false;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
  String userId = '';

  Task({
    required this.userId,
    required this.description,
    required this.isConcluded,
  });

  void updateTask(String newDescription, bool isConcludedChange) {
    description = newDescription;
    isConcluded = isConcludedChange;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['description'] = description;
    data['isConcluded'] = isConcluded;
    data['createdAt'] = Timestamp.fromDate(createdAt);
    data['updatedAt'] = Timestamp.fromDate(updatedAt);
    data['userId'] = userId;

    return data;
  }

  Task.fromJson(Map<String, dynamic> json) {
      description = json['description'];
      isConcluded = json['isConcluded'];
      createdAt = (json['createdAt'] as Timestamp).toDate();
      updatedAt = (json['updatedAt'] as Timestamp).toDate();
      userId = json['userId'];
  }
}
