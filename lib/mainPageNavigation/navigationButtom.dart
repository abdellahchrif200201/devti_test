import 'package:devti_test/mainPageNavigation/AppBar.dart';
import 'package:devti_test/pages/AccountPage.dart';
import 'package:devti_test/pages/DeliveriesPage.dart';
import 'package:devti_test/pages/MyInboxPage.dart';
import 'package:flutter/material.dart';
import '../pages/HomePage.dart';

class MainPages extends StatefulWidget {
  const MainPages({super.key});

  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  int _selectedIndex = 0;

  // List of pages to navigate to
  final List<Widget> _pages = [
    const HomePage(), // Replace with your HomePage widget
    const DeliveriesPage(), // Replace with your SearchPage widget
    const MyInboxPage(), // Replace with your SearchPage widget
    const ProfilePage(), // Replace with your ProfilePage widget
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyappBar(),
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedFontSize: 13,
        unselectedFontSize: 12,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Theme.of(context).textTheme.bodyText1?.color,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.card_travel,
            ),
            label: 'deliveries',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            label: 'My inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
