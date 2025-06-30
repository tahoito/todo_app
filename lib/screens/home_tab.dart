import 'package:flutter/material.dart';
import 'package:todo_app/widgets/category_tag_input.dart';

// Task クラスは外に出す！
class Task {
  final String title;
  final String category;
  final DateTime date;
  final String memo;
  bool isDone;

  Task({
    required this.title,
    required this.category,
    required this.date,
    required this.memo,
    this.isDone = false,
  });
}

class HomeTab extends StatefulWidget {
  final bool showForm;
  final List<Task> tasks;
  final Function(Task) onAddTask;
  final Function(int) onToggleTask;

  const HomeTab({
    super.key,
    required this.showForm,
    required this.tasks,
    required this.onAddTask,
    required this.onToggleTask,
  });

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _memoController = TextEditingController();

  final List<String> _categories = ['家事', '勉強', '仕事', '趣味'];
  String? _selectedCategory;
  DateTime? _selectedDate;

  final List<Task> _tasks = [];

  void _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _addTask() {
    final task = _taskController.text.trim();
    final memo = _memoController.text.trim();
    if (task.isEmpty || _selectedCategory == null || _selectedDate == null) return;

    setState(() {
      _tasks.add(Task(
        title: task,
        category: _selectedCategory!,
        date: _selectedDate!,
        memo: memo,
      ));

      _taskController.clear();
      _memoController.clear();
      _selectedCategory = null;
      _selectedDate = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // ← スクロール可能に
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: CategoryTagInput(),
          ),
          const Divider(),

          if (widget.showForm)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _taskController,
                    decoration: const InputDecoration(
                      hintText: 'タスク入力',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),

                  Wrap(
                    spacing: 8.0,
                    children: _categories.map((cat) {
                      final isSelected = _selectedCategory == cat;
                      return ChoiceChip(
                        label: Text(cat),
                        selected: isSelected,
                        onSelected: (bool selected) {
                          setState(() => _selectedCategory = cat);
                        },
                        selectedColor: Colors.lightBlue[100],
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 12),

                  Row(
                    children: [
                      const Text('日付:'),
                      TextButton(
                        onPressed: _selectDate,
                        child: Text(_selectedDate == null
                            ? '日付を選択'
                            : '${_selectedDate!.year}/${_selectedDate!.month}/${_selectedDate!.day}'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  TextField(
                    controller: _memoController,
                    decoration: const InputDecoration(
                      labelText: 'メモ',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 12),

                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: _addTask,
                      child: const Text('追加'),
                    ),
                  ),
                ],
              ),
            ),

          // タスク表示エリア
          ..._tasks.asMap().entries.map((entry) {
            final index = entry.key;
            final task = entry.value;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              task.isDone = !task.isDone;
                            });
                          },
                          child: Icon(
                            task.isDone
                                ? Icons.radio_button_checked
                                : Icons.radio_button_unchecked,
                            color: task.isDone ? Colors.blue : Colors.black,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          task.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            decoration:
                            task.isDone ? TextDecoration.lineThrough : null,
                            color: task.isDone ? Colors.grey : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${task.date.year}/${task.date.month}/${task.date.day} ・ ${task.category}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    /*if (task.memo.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(task.memo),
                      ),*/
                  ],
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
