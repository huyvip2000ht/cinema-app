import 'package:flutter/material.dart';
import 'package:movie_ticket_app/screens/HomePage/home_page.dart';
import 'package:movie_ticket_app/screens/Login/login_screen.dart';
import 'package:movie_ticket_app/screens/Profile/profile_screen.dart';
import 'package:movie_ticket_app/screens/showtimes/showtimes.dart';
import 'package:movie_ticket_app/screens/store/store.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  int index;

  BottomNavBar(this.index);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  final List<Widget> _child = [
    HomePage(),
    Showtimes(),
    Store(),
    ProfileScreen(),
  ];
  void _setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      body: _child[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _setCurrentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'HOME',
              backgroundColor: Colors.black54),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_movies_outlined),
              label: 'SHOWTIMES',
              backgroundColor: Colors.black54),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_grocery_store),
              label: 'STORE',
              backgroundColor: Colors.black54),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'PROFILE',
              backgroundColor: Colors.black54)
        ],
      ),
    );
  }
}
