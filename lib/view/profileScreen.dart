import 'package:flutter/material.dart';
import 'package:raseeni/model/appStyle.dart';

import 'doneCourses.dart';

class Profilescreen extends StatelessWidget {
  Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: height * .09,
            decoration: BoxDecoration(
              color: appStyles.blueColor,
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
          Align(
            child: Container(
              height: height * 0.79,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: appStyles.whiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: Column(
                  children: [
                    SizedBox(height: height * 0.02),
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        CircleAvatar(
                          radius: 70,
                          backgroundColor: appStyles.darkGreyColor,
                          child: Icon(
                            Icons.person,
                            color: appStyles.blackColor,
                            size: 70,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: appStyles.blueColor,
                              borderRadius: BorderRadius.circular(360),
                            ),
                            child: Icon(
                              Icons.edit,
                              color: appStyles.whiteColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      '@abdo_1284',
                      style: appStyles.smallTitleBlack,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 25,
                        top: 10,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(),
                        child: Row(
                          children: [
                            Icon(
                              appStyles.badge,
                              size: 40,
                              color: appStyles.blueColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ahlan,',
                                  style: appStyles.titleBlackBold,
                                ),
                                Text(
                                  'Abdelarahman Abdelrahman',
                                  style: appStyles.smallTitleBlack,
                                ),
                              ],
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: width * .06),
                              child: GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  appStyles.edit,
                                  color: appStyles.blueColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Container(
                      height: height * 0.23,
                      width: width * 0.9,
                      decoration: BoxDecoration(
                        color: appStyles.blueColor,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: width * 0.05,
                          top: height * 0.02,
                          bottom: height * 0.02,
                          right: width * 0.05,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '‘‘',
                                style: appStyles.headlineWhite,
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.8,
                                  child: Text(
                                    'It takes courage to grow up and become who you really are.',
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
                                    style: appStyles.smallTitleWhite,
                                  ),
                                )
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                ',,',
                                style: appStyles.headlineWhite,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Padding(
                      padding: EdgeInsets.only(
                          right: width * 0.03, left: width * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: height * 0.1,
                              width: width * 0.4,
                              decoration: BoxDecoration(
                                color: appStyles.orangeColor,
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Streak',
                                    style: appStyles.subTitleWhite,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '4',
                                        style: appStyles.subTitleWhite,
                                      ),
                                      Icon(
                                        Icons.local_fire_department,
                                        color: appStyles.whiteColor,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.03,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DoneCourses()));
                            },
                            child: Container(
                              height: height * 0.1,
                              width: width * 0.4,
                              decoration: BoxDecoration(
                                color: appStyles.greenColor,
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Done\nCourses',
                                    style: appStyles.subTitleWhite,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '1',
                                        style: appStyles.subTitleWhite,
                                      ),
                                      Icon(
                                        appStyles.done,
                                        color: appStyles.whiteColor,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Center(
                      child: Text(
                        'Find Us On',
                        style: appStyles.smallTitleBlack,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 40,
                            height: 40,
                            child: Image.asset(
                                'assets/images/social media/facebook.png'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 40,
                            height: 40,
                            child: Image.asset(
                                'assets/images/social media/instagram.png'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 40,
                            height: 40,
                            child: Image.asset(
                                'assets/images/social media/linkedin.png'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 40,
                            height: 40,
                            child: Image.asset(
                                'assets/images/social media/twitter.png'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
