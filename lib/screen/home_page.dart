import 'package:flutter/material.dart';
import 'package:helia/screen/account/account_screen.dart';
import 'package:helia/screen/home/home.dart';
import 'package:helia/screen/search_page/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

int _currentIndex = 0;

final List<Widget> _children = [
  const MyHomePage(),
  const SearchPage(),
  const MyHomePage(),
  const AccountScreen()
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              activeIcon: Icon(Icons.home, color: Colors.blue),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              activeIcon: Icon(Icons.search, color: Colors.blue),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt),
              label: 'Booking',
              activeIcon: Icon(Icons.receipt, color: Colors.blue),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              activeIcon: Icon(Icons.person, color: Colors.blue),
            ),
          ]),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
