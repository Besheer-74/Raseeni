// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:raseeni/model/appStyle.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    double progressPercentage = 70; // Example percentage

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // app Bar
            Container(
              width: double.infinity,
              height: height * .1,
              decoration: BoxDecoration(
                color: appStyles.blueColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    appStyles.logoWithoutBackground,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      appStyles.notificationNone,
                      color: appStyles.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            // progress indicator and courses
            Padding(
              padding: EdgeInsets.only(left: width * 0.03, right: width * 0.03),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: height * 0.3,
                    decoration: BoxDecoration(
                      color: appStyles.yellowColor,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32, top: 32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Top Row: Progress indicator and button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Circular Progress Indicator
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    CircularProgressIndicator(
                                      value: 1.0,
                                      strokeWidth: 12,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          appStyles.whiteColor),
                                    ),
                                    CircularProgressIndicator(
                                      strokeCap: StrokeCap.square,
                                      value: progressPercentage / 100,
                                      strokeWidth: 20,
                                      valueColor: AlwaysStoppedAnimation<Color>(
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
                              // Continue
                              Container(
                                height: height * 0.05,
                                width: width * 0.25,
                                decoration: BoxDecoration(
                                  color: appStyles.indigoColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(35),
                                      bottomLeft: Radius.circular(35)),
                                ),
                                child: Center(
                                  child: Text(
                                    "Continue",
                                    style: appStyles.subTitleWhite,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          // Bottom Row: Title and Subtitle
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Web dev',
                                    style: appStyles.titleBlack,
                                  ),
                                  Text(
                                    'Master Class',
                                    style: appStyles.subTitleBlack,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
