import 'package:flut_app/screens/add_transaction_page.dart';
import 'package:flutter/material.dart';
import '/screens/list_page.dart';
import 'screens/home_page.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  void _ontap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> pages = [
    HomePage(),
    ListPage(),
    AddTransactionPage(),
    Center(child: Text("Statistik Page")),
    Center(child: Text("Settings Page")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        title: Text("Cashflow App", style: TextStyle(color: Colors.white)),
        centerTitle: false,
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.monetization_on,
            size: 30,
            color: Colors.amber[100],
          ),
        ),
        actions: [
          Icon(Icons.notifications, size: 30, color: Colors.amber[100]),
          Icon(Icons.send, size: 30, color: Colors.amber[100]),
          SizedBox(width: 10),
        ],
      ),
      backgroundColor: Colors.amber[700],
      body: SafeArea(child: pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.amber[200],
        selectedItemColor: Colors.amber[900],
        iconSize: 40,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _ontap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '_____',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined),
            label: '_____',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outlined),
            label: '_____',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: '_____',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: '_____',
          ),
        ],
      ),
    );
  }
}
