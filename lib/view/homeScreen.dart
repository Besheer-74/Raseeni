// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:raseeni/model/appStyle.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> courses = [
      {
        'title': 'Flutter',
        'subtitle': 'Master Class',
        'image': appStyles.flutter,
        'progress': 15,
        'color': appStyles.roseColor,
      },
      {
        'title': 'Python',
        'subtitle': 'Master Class',
        'image': appStyles.python,
        'progress': 45,
        'color': appStyles.blueColor,
      },
      {
        'title': 'React',
        'subtitle': 'Master Class',
        'image': appStyles.react,
        'progress': 45,
        'color': appStyles.indigoColor,
      },
      {
        'title': 'Html',
        'subtitle': 'Master Class',
        'image': appStyles.html,
        'progress': 45,
        'color': appStyles.orangeColor,
      },
      {
        'title': 'C++',
        'subtitle': 'Master Class',
        'image': appStyles.cPlusPlus,
        'progress': 5,
        'color': appStyles.greenColor,
      },
    ];

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
            SizedBox(height: height * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Container(
                width: double.infinity,
                height: height * .09,
                decoration: BoxDecoration(
                  color: appStyles.orangeColor,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: width * .07, right: width * .07),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Streak",
                        style: appStyles.titleWhite,
                      ),
                      Row(
                        children: [
                          Text(
                            '4',
                            style: appStyles.headlineWhite,
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.whatshot,
                            color: appStyles.whiteColor,
                            size: 35,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Progress Card
                      Card(
                        elevation: 20,
                        color: appStyles.yellowColor,
                        shape: RoundedRectangleBorder(
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
                                        style: appStyles.smallTitleWhite,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: height * 0.04),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Dart',
                                          style: appStyles.titleBlackBold),
                                      Text('Master Class',
                                          style: appStyles.smallTitleBlack),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.1,
                                    width: width * 0.5,
                                    child: Image.asset(appStyles.dart),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      // GridView
                      GridView.builder(
                        shrinkWrap: true, // Ensures it takes minimal space
                        physics:
                            NeverScrollableScrollPhysics(), // Disables inner scrolling
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 12.0,
                          childAspectRatio: 0.85,
                        ),
                        itemCount: courses.length + 1,
                        itemBuilder: (context, index) {
                          if (index == courses.length) {
                            return addCard(height, width);
                          }
                          final course = courses[index];
                          return courseCard(
                            height,
                            width,
                            course['title'],
                            course['subtitle'],
                            course['image'],
                            course['progress'],
                            course['color'],
                          );
                        },
                      ),
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

  Widget courseCard(double height, double width, String title, String subtitle,
      String image, int progressPercentage, Color color) {
    return Card(
      elevation: 10,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: width * 0.04,
          top: height * 0.03,
          bottom: height * 0.01,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Circular Progress Indicator
            SizedBox(
              height: 50,
              width: 50,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: 1.0,
                    strokeWidth: 10,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(appStyles.whiteColor),
                  ),
                  CircularProgressIndicator(
                    strokeCap: StrokeCap.round,
                    value: progressPercentage / 100,
                    strokeWidth: 10,
                    valueColor: AlwaysStoppedAnimation(appStyles.whiteColor),
                    backgroundColor: appStyles.blackColor,
                  ),
                  Center(
                    child: Text(
                      '${progressPercentage.toInt()}',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: appStyles.whiteColor,
                        letterSpacing: -2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Bottom Row: Title and Subtitle
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: appStyles.subTitleWhite,
                    ),
                    Text(
                      subtitle,
                      style: appStyles.smallTitleWhite,
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: width * 0.04),
                  child: SizedBox(
                    height: height * 0.09,
                    width: width * 0.09,
                    child: Image.asset(
                      image,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget addCard(
    double height,
    double width,
  ) {
    return Card(
      elevation: 10,
      color: appStyles.grayColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              size: 40,
              color: appStyles.whiteColor,
            ),
            Text(
              'Add Course',
              style: appStyles.subTitleWhite,
            ),
          ],
        ),
      ),
    );
  }
}
