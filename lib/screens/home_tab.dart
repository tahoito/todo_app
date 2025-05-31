import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

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
      ],
    );
  }
}
