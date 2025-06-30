import 'package:flutter/material.dart';
import 'package:todo_app/widgets/category_tag_input.dart';

class HomeTab extends StatefulWidget {
  final bool showForm;
  const HomeTab({super.key, required this.showForm});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _memoController = TextEditingController();

  final List<String> _categories = ['家事', '勉強', '仕事', '趣味'];
  String? _selectedCategory;
  DateTime? _selectedDate;

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

    print('追加されたタスク: $task / カテゴリ: $_selectedCategory / 日付: $_selectedDate / メモ: $memo');

    setState(() {
      _taskController.clear();
      _memoController.clear();
      _selectedCategory = null;
      _selectedDate = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      onSelected: (_) {
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
      ],
    );
  }
}
