import 'package:flutter/material.dart';

class AddTaskTab extends StatelessWidget {
  const AddTaskTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // タスクリスト（オプション）
        Expanded(
          child: ListView(children: const [
            ListTile(
              title: Text('（ここに既存タスクが出るとかでもOK）'),
            )
          ]),
        ),
        // 入力欄
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          color: Colors.white,
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'タスクを入力する',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Expanded(child: Text('カテゴリ: 家事')),
                  ElevatedButton(
                    onPressed: () {
                      // 保存処理
                    },
                    child: const Text('追加'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
