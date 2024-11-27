import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import '../controller/bottomNavBarController.dart';
import 'chatScreen.dart';
import 'dashboardScreen.dart';
import 'homeScreen.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bottomNavBarController =
        Provider.of<Bottomnavbarcontroller>(context);

    final List<Widget> _pages = [
      Homescreen(),
      Chatscreen(),
      Dashboardscreen(),
    ];

    return Scaffold(
      body: _pages[_bottomNavBarController.currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
        child: GNav(
          rippleColor: Colors.purple.shade100,
          hoverColor: Colors.purple.shade100,
          gap: 8,
          activeColor: Colors.purple,
          iconSize: 24,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: Duration(milliseconds: 400),
          tabBackgroundColor: Colors.purple.shade100,
          color: Colors.black,
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.chat_rounded,
              text: 'Chat',
            ),
            GButton(
              icon: Icons.dashboard,
              text: 'Dashboard',
            ),
          ],
          selectedIndex: _bottomNavBarController.currentIndex,
          onTabChange: (index) {
            _bottomNavBarController.selectedScreen(index);
          },
        ),
      ),
    );
  }
}
