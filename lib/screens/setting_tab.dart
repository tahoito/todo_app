import 'package:flutter/material.dart';

class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  bool _notificationsEnabled = true;
  String _selectedTheme = 'blue'; // デフォルトテーマ（仮）

  final TextEditingController _memoController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔔 通知
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('通知', style: TextStyle(fontSize: 18)),
              Switch(
                value: _notificationsEnabled,
                onChanged: (value) {
                  setState(() => _notificationsEnabled = value);
                },
              ),
            ],
          ),

          const SizedBox(height: 16),

          // 🗑 一括削除ボタン
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('全てのタスクを削除する', style: TextStyle(fontSize: 16)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
                onPressed: () {
                  // 削除処理あとで追加！
                },
                child: const Text('削除', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // 🎨 テーマ選択
          const Text('テーマ', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildColorCircle('blue', Colors.lightBlue),
              _buildColorCircle('pink', Colors.pinkAccent),
              _buildColorCircle('green', Colors.lightGreen),
              _buildColorCircle('orange', Colors.orange),
              _buildColorCircle('purple', Colors.deepPurpleAccent),
              _buildColorCircle('yellow', Colors.amber),
            ],
          ),

          const SizedBox(height: 24),

          // 📝 ひとこと
          const Text('ひとこと', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 8),
          TextField(
            controller: _memoController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: '入力してください',
            ),
            maxLines: 2,
          ),

          const SizedBox(height: 24),

          // ℹ️ アプリについて（仮）
          const Text('アプリについて', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 8),
          TextField(
            controller: _aboutController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'ここに説明が入ります',
            ),
            maxLines: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildColorCircle(String name, Color color) {
    return GestureDetector(
      onTap: () {
        setState(() => _selectedTheme = name);
      },
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: _selectedTheme == name ? Colors.black : Colors.transparent,
            width: 2,
          ),
        ),
      ),
    );
  }
}
