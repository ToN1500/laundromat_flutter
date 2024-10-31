// model/todolist_model.dart
class TodolistModel {
  String title;
  bool isChecked;
  DateTime? dueDate;
  String? category;

  TodolistModel({
    required this.title,
    this.isChecked = false,
    this.dueDate,
    this.category,
  });
}
