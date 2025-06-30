import 'package:flutter/material.dart';
import 'home_tab.dart';
import 'search_tab.dart';
import 'setting_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _showTaskForm = false;

  // ← ここを static const じゃなくて関数に変更！！
  List<Widget> _screens(bool showForm) => [
    HomeTab(showForm: showForm), // 👈 ここに渡せるようになる
    SearchTab(),
    const SizedBox.shrink(), // 追加タブは空
    const Center(child: Text('カレンダー')),
    SettingTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      if (index == 2) {
        _selectedIndex = 0; // ホームに戻る
        _showTaskForm = true; // フォームだけ出す
      } else {
        _selectedIndex = index;
        _showTaskForm = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ホーム',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF92E9FF),
      ),
      body: _screens(_showTaskForm)[_selectedIndex], // ← ここで渡してる！
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF92E9FF),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '探す'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: '追加'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'カレンダー'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '設定'),
        ],
      ),
    );
  }
}

