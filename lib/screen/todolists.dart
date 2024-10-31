import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:laundromat_flutter/model/todolist_model.dart';
import 'package:laundromat_flutter/service/todolist/todolist_service.dart';

class Todolists extends StatefulWidget {
  const Todolists({super.key});

  @override
  State<Todolists> createState() => _TodolistsState();
}

class _TodolistsState extends State<Todolists> {
  final TextEditingController _textController = TextEditingController();
  final TodolistService _todolistService = Get.put(TodolistService());
  TodolistModel? _lastDeletedItem;
  int? _lastDeletedItemIndex;

  Future<void> _selectDueDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      _todolistService.selectedDueDate.value = pickedDate;
    }
  }

  Future<void> _confirmDelete(int index) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ยืนยันการลบ'),
          content: const Text('คุณแน่ใจหรือว่าต้องการลบรายการนี้?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('ยกเลิก'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('ลบ'),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      _lastDeletedItem = _todolistService.todoList[index];
      _lastDeletedItemIndex = index;
      _todolistService.delTodolist(index);
      _showUndoSnackbar();
    }
  }

  void _showUndoSnackbar() {
    final snackBar = SnackBar(
      content: const Text('รายการถูกลบแล้ว'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          if (_lastDeletedItem != null && _lastDeletedItemIndex != null) {
            _todolistService.todoList
                .insert(_lastDeletedItemIndex!, _lastDeletedItem!);
          }
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final listCategory = ['Work', 'Home', 'Personal', 'Other'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (['All', 'Incomplete', 'Completed'].contains(value)) {
                _todolistService.updateFilter(value);
              } else {
                _todolistService.updateSortOption(value);
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'All', child: Text('ทั้งหมด')),
              PopupMenuItem(value: 'Incomplete', child: Text('ยังไม่เสร็จ')),
              PopupMenuItem(value: 'Completed', child: Text('เสร็จแล้ว')),
              PopupMenuDivider(),
              PopupMenuItem(
                  value: 'Date', child: Text('เรียงตามวันที่ครบกำหนด')),
              PopupMenuItem(value: 'Category', child: Text('เรียงตามหมวดหมู่')),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: SizedBox(
                      width: 300,
                      child: TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                          labelText: 'รายการที่ต้องทํา',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("หมวดหมู่"),
                      Obx(() => DropdownButton<String>(
                            value: _todolistService.selectedCategory.value,
                            onChanged: (newValue) {
                              if (newValue != null) {
                                _todolistService.selectedCategory.value =
                                    newValue;
                              }
                            },
                            items: listCategory.map<DropdownMenuItem<String>>(
                              (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                          )),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Obx(() => TextButton(
                        onPressed: () => _selectDueDate(context),
                        child: Text(_todolistService.selectedDueDate.value ==
                                null
                            ? 'เลือกวันที่ครบกำหนด'
                            : 'ครบกำหนด: ${DateFormat('dd/MM/yyyy').format(_todolistService.selectedDueDate.value!)}'),
                      )),
                  ElevatedButton(
                    onPressed: () {
                      if (_textController.text.isNotEmpty) {
                        _todolistService.addTodolist(
                          _textController.text,
                          category: _todolistService.selectedCategory.value,
                          dueDate: _todolistService.selectedDueDate.value,
                        );
                        _textController.clear();
                        _todolistService.selectedDueDate.value = null;
                        FocusScope.of(context).unfocus(); // ปิดแป้นพิมพ์
                      }
                    },
                    child: const Text("เพิ่ม"),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Obx(() {
                  final items = _todolistService.getFilteredTodoList();
                  return items.isEmpty
                      ? const Center(child: Text('ไม่มีรายการที่ต้องทํา'))
                      : ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            return ListTile(
                              leading: SizedBox(
                                width: 24, // กำหนดความกว้างที่แน่นอน
                                child: Checkbox(
                                  value: item.isChecked,
                                  onChanged: (newValue) {
                                    if (newValue != null) {
                                      _todolistService.toggleCheck(
                                          index, newValue);
                                    }
                                  },
                                ),
                              ),
                              title: Text(item.title),
                              subtitle: Text(
                                  '${item.category ?? ''} • ครบกำหนด: ${item.dueDate != null ? DateFormat('dd/MM/yyyy').format(item.dueDate!) : 'ไม่ระบุ'}'),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => _confirmDelete(index),
                              ),
                            );
                          },
                        );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
