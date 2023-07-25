class TaskModel {
  String name;
  bool isDone;

  TaskModel({
    required this.name,
    required this.isDone,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      name: json["name"],
      isDone: bool.parse(
        json["isDone"],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "isDone": isDone,
    };
  }
}
