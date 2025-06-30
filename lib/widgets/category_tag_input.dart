import 'package:flutter/material.dart';

class CategoryTagInput extends StatefulWidget {
  const CategoryTagInput({super.key});

  @override
  State<CategoryTagInput> createState() => _CategoryTagInputState();
}

class _CategoryTagInputState extends State<CategoryTagInput> {
  final TextEditingController _controller = TextEditingController();
  List<String> _tags = ['全て'];
  bool _showInputForm = false;

  void _addTag() {
    final newTag = _controller.text.trim();
    if (newTag.isNotEmpty && !_tags.contains(newTag)) {
      setState(() {
        _tags.add(newTag);
        _controller.clear();
        _showInputForm = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // 左右に余白追加
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8.0,
            children: _tags
                .map((tag) => Chip(
              label: Text(tag),
              backgroundColor: Colors.lightBlue[50],
            ))
                .toList(),
          ),

          // プラスボタン（右寄せ・少し上に調整）
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    _showInputForm = !_showInputForm;
                  });
                },
              ),
            ),
          ),

          // 押されたら表示される入力フォーム
          if (_showInputForm)
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'カテゴリを入力',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: _addTag,
                  child: const Text('追加'),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
