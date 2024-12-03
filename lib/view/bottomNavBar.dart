import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raseeni/model/appStyle.dart';

import '../controller/bottomNavBarController.dart';
import 'profileScreen.dart';
import 'chat/chatScreen.dart';
import 'dashboard/dashboardScreen.dart';
import 'homeScreen.dart';

class BottomNavBar extends StatelessWidget {
  final List<Widget> _pages = [
    Homescreen(),
    Chatscreen(),
    Dashboardscreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;

    final _bottomNavBarController =
        Provider.of<BottomNavBarController>(context);

    return Scaffold(
      body: Stack(
        children: [
          _pages[_bottomNavBarController.currentIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  height: height * 0.06,
                  decoration: BoxDecoration(
                    color: AppStyles.whiteColor.withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildIcon(AppStyles.home, 0, _bottomNavBarController),
                      _buildIcon(AppStyles.chat, 1, _bottomNavBarController),
                      _buildIcon(
                          AppStyles.dashboard, 2, _bottomNavBarController),
                      _buildIcon(AppStyles.profile, 3, _bottomNavBarController),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(
      IconData icon, int index, BottomNavBarController controller) {
    return GestureDetector(
      onTap: () => controller.selectedScreen(index),
      child: Icon(
        icon,
        color: controller.currentIndex == index
            ? AppStyles.indigoColor
            : AppStyles.blackColor,
      ),
    );
  }
}
