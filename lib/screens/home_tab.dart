import 'package:flutter/material.dart';
import 'package:todo_app/widgets/category_tag_input.dart';

class HomeTab extends StatefulWidget {
  final bool showForm;
  const HomeTab({super.key, required this.showForm});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // タグの入力
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: CategoryTagInput(),
        ),

        const Divider(),

        // タスク入力フォーム（＋押されたときだけ表示）
        if (widget.showForm)
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'タスク入力',
                border: OutlineInputBorder(),
              ),
            ),
          ),

        // ここにタスク一覧など続けてOK
      ],
    );
  }
}
