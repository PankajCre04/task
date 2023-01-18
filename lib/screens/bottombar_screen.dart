import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:task/screens/home_screen.dart';
import 'package:task/screens/spend_screen.dart';
import 'package:task/screens/splash_screen.dart';

class BottombarScreen extends StatefulWidget {
  BottombarScreen({Key? key}) : super(key: key);
  static const String routeName = "/bottombarScreen";
  @override
  State<BottombarScreen> createState() => _BottombarScreenState();
}

class _BottombarScreenState extends State<BottombarScreen> {
  int _pageIndex = 0;

  final pages = [
    const HomeScreen(),
    const SpendScreen(),
    const Scaffold(body: Center(child: Text("Add Screen"))),
    const Scaffold(body: Center(child: Text("Cards Screen"))),
    const Scaffold(body: Center(child: Text("Profile Screen"))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey.withOpacity(0.9),
        onTap: (newIndex) => setState(() => _pageIndex = newIndex),
        currentIndex: _pageIndex,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ""),
          const BottomNavigationBarItem(icon: Icon(Icons.history), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.add, color: Colors.blue.shade900), label: ""),
          const BottomNavigationBarItem(icon: Icon(Icons.wallet), label: ""),
          const BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: ""),
        ],
      ),
    );
  }
}
