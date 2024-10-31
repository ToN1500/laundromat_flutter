// todolist_service.dart
import 'package:get/get.dart';
import 'package:laundromat_flutter/model/todolist_model.dart';

class TodolistService extends GetxController {
  final RxList<TodolistModel> todoList = <TodolistModel>[].obs;
  final RxString filter = 'All'.obs;
  final RxString sortOption = 'Date'.obs;
  final Rx<DateTime?> selectedDueDate = Rx<DateTime?>(null);
  final RxString selectedCategory = 'Work'.obs;

  void addTodolist(String title, {String? category, DateTime? dueDate}) {
    todoList.add(TodolistModel(
      title: title,
      category: category,
      dueDate: dueDate,
    ));
    print("todoList: ${todoList.length}");
  }

  void delTodolist(int index) {
    todoList.removeAt(index);
  }

  List<TodolistModel> getFilteredTodoList() {
    List<TodolistModel> filteredList;
    switch (filter.value) {
      case 'Completed':
        filteredList = todoList.where((item) => item.isChecked).toList();
        break;
      case 'Incomplete':
        filteredList = todoList.where((item) => !item.isChecked).toList();
        break;
      default:
        filteredList = todoList.toList();
    }

    if (sortOption.value == 'Date') {
      filteredList.sort((a, b) => 
        (a.dueDate ?? DateTime.now()).compareTo(b.dueDate ?? DateTime.now()));
    } else if (sortOption.value == 'Category') {
      filteredList.sort((a, b) => 
        (a.category ?? '').compareTo(b.category ?? ''));
    }
    return filteredList;
  }

  void updateFilter(String newFilter) {
    filter.value = newFilter;
  }

  void updateSortOption(String newSort) {
    sortOption.value = newSort;
  }

  void toggleCheck(int index, bool value) {
    todoList[index].isChecked = value;
    todoList.refresh(); // Refresh the list to update UI
  }
}