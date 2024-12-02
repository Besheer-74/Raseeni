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
            height: height * .11,
            decoration: BoxDecoration(
              color: AppStyles.blueColor,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(AppStyles.logoWithoutBackground),
                ),
                Positioned(
                  right: 16,
                  top: 16,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      AppStyles.notificationNone,
                      color: AppStyles.whiteColor,
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
                  color: AppStyles.whiteColor,
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
                          radius: 50,
                          backgroundColor: AppStyles.grayColor,
                          child: Icon(
                            Icons.person,
                            color: AppStyles.blackColor,
                            size: 50,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: AppStyles.blueColor,
                              borderRadius: BorderRadius.circular(360),
                            ),
                            child: Icon(
                              Icons.edit,
                              color: AppStyles.whiteColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      '@abdo_1284',
                      style: AppStyles.regular16(AppStyles.blackColor),
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
                              AppStyles.badge,
                              size: 40,
                              color: AppStyles.blueColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ahlan,',
                                  style: AppStyles.bold20(AppStyles.blackColor),
                                ),
                                SizedBox(
                                  width: width * 0.6,
                                  child: Text(
                                    'Abdelarahman Abdelarahman',
                                    style: AppStyles.regular20(
                                        AppStyles.blackColor),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: width * .06),
                              child: GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  AppStyles.edit,
                                  color: AppStyles.blueColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    Container(
                      width: width * 0.9,
                      // height: height * 0.25,
                      decoration: BoxDecoration(
                        color: AppStyles.blueColor,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '‘‘',
                                style: AppStyles.bold48(AppStyles.whiteColor),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.8,
                              child: Text(
                                'It takes courage to grow up and become who you really are.',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: AppStyles.medium20(AppStyles.whiteColor),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                ',,',
                                style: AppStyles.bold48(AppStyles.whiteColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.03),
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
                                color: AppStyles.orangeColor,
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Streak',
                                    style: AppStyles.regular20(
                                        AppStyles.whiteColor),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '4',
                                        style: AppStyles.bold20(
                                            AppStyles.whiteColor),
                                      ),
                                      Icon(
                                        Icons.local_fire_department,
                                        color: AppStyles.whiteColor,
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
                                color: AppStyles.greenColor,
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Done\nCourses',
                                    style: AppStyles.regular20(
                                        AppStyles.whiteColor),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '1',
                                        style: AppStyles.bold20(
                                            AppStyles.whiteColor),
                                      ),
                                      Icon(
                                        AppStyles.done,
                                        color: AppStyles.whiteColor,
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
                      height: height * 0.03,
                    ),
                    Center(
                      child: Text(
                        'Find Us On',
                        style: AppStyles.regular16(AppStyles.blackColor),
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
