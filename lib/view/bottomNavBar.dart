import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raseeni/model/appStyle.dart';

import '../controller/bottomNavBarController.dart';
import 'profileScreen.dart';
import 'dashboard/dashboardScreen.dart';
import 'homeScreen.dart';

class BottomNavBar extends StatelessWidget {
  final List<Widget> _pages = [
    Homescreen(),
    Dashboardscreen(),
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
                      _buildIcon(
                          AppStyles.home, 0, _bottomNavBarController, context),
                      _buildIcon(
                          AppStyles.chat, 1, _bottomNavBarController, context),
                      _buildIcon(AppStyles.dashboard, 2,
                          _bottomNavBarController, context),
                      _buildIcon(AppStyles.profile, 3, _bottomNavBarController,
                          context),
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

  Widget _buildIcon(IconData icon, int index, BottomNavBarController controller,
      BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (index == 1) {
          // Show the dialog for Chat tab
          _showComingSoonDialog(context);
        } else {
          // Change the screen for other tabs
          controller.selectedScreen(index);
        }
      },
      child: Icon(
        icon,
        color: controller.currentIndex == index
            ? AppStyles.indigoColor
            : AppStyles.blackColor,
      ),
    );
  }

  void _showComingSoonDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            'Coming soon',
            style: AppStyles.bold20(AppStyles.blackColor),
          ),
          content: Text(
              'We are preparing an awesome feature for you. Stay tuned.',
              textAlign: TextAlign.center,
              style: AppStyles.regular16(AppStyles.blackColor)),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Done",
                style: AppStyles.bold15(AppStyles.blackColor),
              ),
            ),
          ],
        );
      },
    );
  }

  // void _showComingSoonDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => Dialog(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(16),
  //       ),
  //       backgroundColor: AppStyles.darkGrayColor,
  //       child: Padding(
  //         padding: const EdgeInsets.all(20),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Text('Coming soon',
  //                 style: AppStyles.bold20(
  //                   AppStyles.blackColor,
  //                 )),
  //       SizedBox(height: 16),
  // Text('We are preparing an awesome feature for you. Stay tuned.',
  //     textAlign: TextAlign.center,
  //     style: AppStyles.regular16(AppStyles.blackColor)),
  //             const SizedBox(height: 24),
  //             TextButton(
  //               onPressed: () => Navigator.of(context).pop(),
  //               style: TextButton.styleFrom(
  //                 foregroundColor: AppStyles.blackColor,
  //                 textStyle: TextStyle(
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.w500,
  //                 ),
  //               ),
  //               child: const Text('Done'),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
