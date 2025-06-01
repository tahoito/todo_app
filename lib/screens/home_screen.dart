import 'package:flutter/material.dart';
import 'home_tab.dart';
import 'search_tab.dart';
import 'add_task_tab.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  int _selectedIndex = 0;//どのタブが選ばれるか

  static const List<Widget> _screens = <Widget> [
    HomeTab(),
    SearchTab(),
    AddTaskTab(),
    Center(child: Text('追加')),
    Center(child: Text('カレンダー')),
    Center(child: Text('設定')),
  ];

  void _onItemTapped(int index){
    setState((){
        _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: const Text(
          'ホーム',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF92E9FF),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF92E9FF),//洗濯中のアイコンの色
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '探す',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: '追加',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'カレンダー',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '設定',
          ),
        ]
      ),
    );
  }
}