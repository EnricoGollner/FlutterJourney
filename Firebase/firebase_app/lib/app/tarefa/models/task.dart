
class Task {
  String description = '';
  bool isConcluded = false;

  Task(
    this.description,
    this.isConcluded,
  );

  void updateTask(String newDescription, bool isConcludedChange) {
    description = newDescription;
    isConcluded = isConcludedChange;
  }

  Task copyWith({
    String? description,
    bool? isConcluded,
  }) {
    return Task(
      description ?? this.description,
      isConcluded ?? this.isConcluded,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'description': description,
      'isConcluded': isConcluded,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      json['description'],
      json['isConcluded'],
    );
  }
}
