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
          height: 70,
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

        const Divider(
          color: Colors.black,
          thickness: 1,
          height: 8,
          indent: 16,
          endIndent: 16,
        ),

        // タスクリスト
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey, width: 1),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ○ チェックアイコン
              Container(
                margin: const EdgeInsets.only(top: 4),
                child: const Icon(
                  Icons.radio_button_unchecked,
                  size: 28,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 12),

              // タスク情報（タイトル＋日付）
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'お風呂掃除をする',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '今日',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              // タグ（家事など）
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.lightBlue[100],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  '家事',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
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