import 'package:flutter/material.dart';
import 'debit_account_screen.dart';
import 'profile_tab.dart';

class MainDashboard extends StatefulWidget {
  final int initialIndex;
  const MainDashboard({super.key, this.initialIndex = 0});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  late int _currentIndex;

  final List<Widget> _screens = [
    // Replace these placeholders with your actual tab widgets
    ProfileTab(), // your profile tab
    Center(child: Text('Add Screen', style: TextStyle(color: Colors.white))),
    Center(child: Text('Budgets Screen', style: TextStyle(color: Colors.white))),
    DebitAccountScreen(), // Your debit account screen
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Budgets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Spending',
          ),
        ],
      ),
    );
  }
}
