import 'package:flutter/material.dart';
import 'package:project/screens/cart_screen.dart';
import 'package:project/screens/feeds_screen.dart';
import 'package:project/screens/home_screen.dart';
import 'package:project/screens/search_screen.dart';
import 'package:project/screens/user_screen.dart';

class BottomNavScreen extends StatefulWidget {
  static const routeName = '/Bottom-nav-screen';
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _pages = [
    HomeScreen(),
    FeedsScreen(),
    const SearchScreen(),
    const CartScreen(),
    const UserScreen(),
  ];
  int _currentIndex = 0;
  _onTap(int i) {
    if (i == 2) {
      return;
    } else {
      setState(() {
        _currentIndex = i;
      });
    }
  }

  // int search = 0;
  _searchTap(int i) {
    setState(() {
      _currentIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.blueGrey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: 'Home', tooltip: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.rss_feed_rounded),
            label: 'Feed',
            tooltip: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(null),
            label: '',
            tooltip: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_rounded),
              label: 'Cart',
              tooltip: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: 'User', tooltip: 'User')
        ],
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        heroTag: 'btn2',
        onPressed: () {
          _searchTap(2);
        },
        child: const Icon(Icons.search_rounded),
        tooltip: 'Search',
      ),
    );
  }
}
