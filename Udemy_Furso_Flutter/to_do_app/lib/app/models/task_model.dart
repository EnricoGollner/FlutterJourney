class TaskModel {
  String taskName;
  DateTime dateAdded;

  TaskModel({required this.taskName, required this.dateAdded});

  Map<String, dynamic> toJson() {
    return {
      "taskName": taskName,
      "dateAdded": dateAdded
          .toIso8601String(), // Padrão de armazenamento de data e horário, pois JSON só armazena tipos primitivos.
    };
  }
}
