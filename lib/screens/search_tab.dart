import 'package:flutter/material.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Padding(
          padding:const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
              hintText: 'タスクを検索',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        // 検索結果（ダミー）
        Expanded(
          child: ListView(
            children: const [
              ListTile(
              title: Text('英語の宿題をやる'),
              subtitle: Text('カテゴリー：学校'),
              ),
              ListTile(
                title: Text('バイトのシフト確認'),
                subtitle: Text('カテゴリー：バイト'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}