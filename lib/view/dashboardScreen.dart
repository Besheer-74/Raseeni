// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../model/appStyle.dart';

class Dashboardscreen extends StatelessWidget {
  List<Map<String, dynamic>> explore = [
    {
      'title': 'Soft Skill',
      'icon': appStyles.skills,
    },
    {
      'title': 'Project Ideas',
      'icon': appStyles.project,
    },
    {
      'title': 'About Hardware',
      'icon': appStyles.hardware,
    },
    {
      'title': 'Software Trends',
      'icon': appStyles.trends,
    },
  ];
  List<Map<String, dynamic>> codingVocab = [
    {
      'title': 'Git',
      'subtitle': 'Commandes',
      'icon': appStyles.git,
    },
    {
      'title': 'Main',
      'subtitle': 'References',
      'icon': appStyles.main,
    },
    {
      'title': 'Coding',
      'subtitle': 'References',
      'icon': appStyles.coding,
    },
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    double progressPercentage = 70;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            Container(
              width: double.infinity,
              height: height * .09,
              decoration: BoxDecoration(
                color: appStyles.blueColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(appStyles.logoWithoutBackground),
                  ),
                  Positioned(
                    right: 16,
                    top: 16,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        appStyles.notificationNone,
                        color: appStyles.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: appStyles.whiteColor,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.07,
                        top: height * 0.03,
                        bottom: height * 0.02,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        CircularProgressIndicator(
                                          strokeCap: StrokeCap.round,
                                          value: progressPercentage / 100,
                                          strokeWidth: 20,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  appStyles.yellowColor),
                                          backgroundColor: appStyles.blackColor,
                                        ),
                                        Center(
                                          child: Text(
                                            '${progressPercentage.toInt()}',
                                            style: TextStyle(
                                              fontFamily: 'IBM Plex Sans',
                                              fontSize: 38,
                                              fontWeight: FontWeight.w700,
                                              color: appStyles.yellowColor,
                                              letterSpacing: -2,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Web dev',
                                        style: appStyles.subTitleBlack,
                                      ),
                                      Text('Master Class',
                                          style: appStyles.subTitleBlack),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: width * 0.1,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  progressIndcator(
                                    50,
                                    50,
                                    70,
                                    appStyles.indigoColor,
                                    appStyles.blackColor,
                                  ),
                                  SizedBox(
                                    height: height * 0.04,
                                  ),
                                  progressIndcator(
                                    50,
                                    50,
                                    20,
                                    appStyles.greenColor,
                                    appStyles.blackColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: width * .5,
                                  height: height * 0.06,
                                  decoration: BoxDecoration(
                                    color: appStyles.orangeColor,
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "View All",
                                      style: appStyles.subTitleWhite,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Explore",
                      style: appStyles.titleBlack,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: height * .14,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: explore.length,
                      itemBuilder: (context, index) {
                        final _explore = explore[index];
                        return exploreCard(
                          height,
                          width,
                          _explore['title'],
                          _explore['icon'],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Coding Vocab",
                      style: appStyles.titleBlack,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: height * .17,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: codingVocab.length,
                      itemBuilder: (context, index) {
                        final _codingVocab = codingVocab[index];
                        return codingVocabCard(
                            height,
                            width,
                            _codingVocab['title'],
                            _codingVocab['subtitle'],
                            _codingVocab['icon']);
                      },
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

  Widget progressIndcator(
    double height,
    double width,
    int progressPercentage,
    Color valueColor,
    Color backgroundColor,
  ) {
    return Row(
      children: [
        SizedBox(
          height: height,
          width: width,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                strokeCap: StrokeCap.round,
                value: progressPercentage / 100,
                strokeWidth: 10,
                valueColor: AlwaysStoppedAnimation<Color>(valueColor),
                backgroundColor: backgroundColor,
              ),
              Center(
                child: Text(
                  '${progressPercentage.toInt()}',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: valueColor,
                    letterSpacing: -2,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
        Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text('Web dev', style: appStyles.subTitleBlack)),
            Text('Master Class', style: appStyles.subTitleBlack),
          ],
        ),
      ],
    );
  }

  Widget exploreCard(double height, double width, String title, String icon) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 5,
        color: appStyles.indigoColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        child: SizedBox(
          height: height * 0.14,
          width: width * 0.5,
          child: Padding(
            padding: EdgeInsets.only(
              left: width * 0.04,
              top: height * 0.02,
              right: width * 0.04,
              bottom: height * 0.02,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(icon),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    title,
                    style: appStyles.subTitleWhite,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget codingVocabCard(
      double height, double width, String title, String subtitle, String icon) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 5,
        color: appStyles.blackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        child: SizedBox(
          height: height * 0.14,
          width: width * 0.8,
          child: Padding(
            padding: EdgeInsets.only(
              left: width * 0.04,
              top: height * 0.02,
              right: width * 0.04,
              bottom: height * 0.02,
            ),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    icon,
                  ),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: appStyles.subTitleWhite,
                      ),
                      Text(
                        subtitle,
                        style: appStyles.subTitleWhite,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
