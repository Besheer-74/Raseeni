import 'package:flutter/material.dart';

import '../model/appStyle.dart';
import 'bottomNavBar.dart';
import 'profileScreen.dart';

class DoneCourses extends StatelessWidget {
  const DoneCourses(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    double progressPercentage = 100;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: height * .1,
              decoration: BoxDecoration(
                color: appStyles.greenColor,
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 16,
                    top: 16,
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.check,
                        color: appStyles.whiteColor,
                        size: 35,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    top: 16,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomNavBar()));
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: appStyles.whiteColor,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              child: Container(
                height: height * 0.81,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: appStyles.blackColor.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, -3),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  child: Column(
                    children: [
                      SizedBox(height: height * 0.02),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: appStyles.redColor),
                        width: width * 0.9,
                        height: height * 0.3,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: width * 0.07,
                            top: height * 0.03,
                            bottom: height * 0.02,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        CircularProgressIndicator(
                                          value: 1.0,
                                          strokeWidth: 12,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  appStyles.whiteColor),
                                        ),
                                        CircularProgressIndicator(
                                          strokeCap: StrokeCap.round,
                                          value: progressPercentage / 100,
                                          strokeWidth: 20,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  appStyles.whiteColor),
                                          backgroundColor: appStyles.blackColor,
                                        ),
                                        Center(
                                          child: Text(
                                            '${progressPercentage.toInt()}',
                                            style: TextStyle(
                                              fontFamily: 'IBM Plex Sans',
                                              fontSize: 38,
                                              fontWeight: FontWeight.w700,
                                              color: appStyles.whiteColor,
                                              letterSpacing: -2,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  right: width * 0.07,
                                  top: height * 0.03,
                                  bottom: height * 0.02,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Data Bases',
                                          style: appStyles.subTitleWhite,
                                        ),
                                        Text(
                                          'Master Class',
                                          style: TextStyle(
                                              color: appStyles.whiteColor),
                                        )
                                      ],
                                    ),
                                    Icon(
                                      Icons.storage,
                                      color: appStyles.whiteColor,
                                      size: 90,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
