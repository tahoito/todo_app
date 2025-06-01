import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // カテゴリーチップ
        SizedBox(
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Chip(label: Text('すべて')),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Chip(label: Text('学校')),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Chip(label: Text('バイト')),
              ),
            ],
          ),
        ),

        // タスクリスト
        Expanded(
          child: ListView(
            children: const [
              ListTile(
                leading: Icon(Icons.check_box_outline_blank),
                title: Text('英語の宿題をやる'),
                subtitle: Text('締切：5/31'),
              ),
              ListTile(
                leading: Icon(Icons.check_box),
                title: Text('バイトのシフト確認'),
                subtitle: Text('締切：5/30'),
              ),
            ],
          ),
        ),
        // 📝 入力フォーム（追加部分）
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
                  const Expanded(child: Text('カテゴリ: 家事')), // ← 仮
                  ElevatedButton(
                    onPressed: () {
                      // あとで追加処理を書く！
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