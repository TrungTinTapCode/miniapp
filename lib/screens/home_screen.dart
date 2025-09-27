import 'package:flutter/material.dart';
import 'expense_screen.dart';
import 'todo_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    ExpenseScreen(),
    TodoScreen(),
  ];

  final List<String> _titles = const [
    "Quản lý chi tiêu",
    "To-do List",
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: "Chi tiêu",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: "To-do",
          ),
        ],
      ),
    );
  }
}
