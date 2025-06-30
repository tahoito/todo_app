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
    return Column(
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

        //プラスボタンを押すと
        Align(
          alignment : Alignment.centerRight,
          child : IconButton(
            icon: const Icon(Icons.add),
            onPressed:(){
              setState(() {
                _showInputForm = !_showInputForm;
              });
            },
          ),
        ),

        //もし押されたら
        if(_showInputForm)
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
    );
  }
}
