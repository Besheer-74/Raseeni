// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:raseeni/model/appStyle.dart';

import 'streakScreen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> courses = [
      {
        'title': 'Flutter',
        'subtitle': 'Master Class',
        'image': AppStyles.flutter,
        'progress': 15,
        'color': AppStyles.roseColor,
      },
      {
        'title': 'Python',
        'subtitle': 'Master Class',
        'image': AppStyles.python,
        'progress': 45,
        'color': AppStyles.blueColor,
      },
      {
        'title': 'React',
        'subtitle': 'Master Class',
        'image': AppStyles.react,
        'progress': 45,
        'color': AppStyles.indigoColor,
      },
      {
        'title': 'Html',
        'subtitle': 'Master Class',
        'image': AppStyles.html,
        'progress': 45,
        'color': AppStyles.orangeColor,
      },
      {
        'title': 'C++',
        'subtitle': 'Master Class',
        'image': AppStyles.cPlusPlus,
        'progress': 5,
        'color': AppStyles.greenColor,
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
            _buildAppBar(height),
            _buildStreakCard(width, height, context),
            SizedBox(height: height * 0.01),
            _buildScrollableContent(width, height, courses, progressPercentage),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(double height) {
    return Container(
      width: double.infinity,
      height: height * .09,
      decoration: BoxDecoration(
        color: AppStyles.blueColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(35),
          bottomLeft: Radius.circular(35),
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              AppStyles.logoWithoutBackground,
            ),
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
    );
  }

  Widget _buildStreakCard(double width, double height, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.01),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => Streakscreen(),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          height: height * .09,
          decoration: BoxDecoration(
            color: AppStyles.orangeColor,
            borderRadius: BorderRadius.circular(35),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .07),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Streak",
                    style: AppStyles.regular24(AppStyles.whiteColor)),
                Row(
                  children: [
                    Text('4', style: AppStyles.bold32(AppStyles.whiteColor)),
                    SizedBox(width: 4),
                    Icon(AppStyles.streak,
                        color: AppStyles.whiteColor, size: 35),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScrollableContent(double width, double height,
      List<Map<String, dynamic>> courses, double progressPercentage) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProgressCard(width, height, progressPercentage),
              SizedBox(height: height * 0.02),
              _buildCourseGrid(width, height, courses),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressCard(
      double width, double height, double progressPercentage) {
    return Card(
      elevation: 20,
      color: AppStyles.yellowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: width * 0.07, top: height * 0.03, bottom: height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            AlwaysStoppedAnimation<Color>(AppStyles.whiteColor),
                        backgroundColor: AppStyles.blackColor,
                      ),
                      Center(
                        child: Text('${progressPercentage.toInt()}',
                            style: AppStyles.bold48(AppStyles.whiteColor)),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: height * 0.05,
                  width: width * 0.25,
                  decoration: BoxDecoration(
                    color: AppStyles.indigoColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      bottomLeft: Radius.circular(35),
                    ),
                  ),
                  child: Center(
                    child: Text("Continue",
                        style: AppStyles.bold12(
                          AppStyles.whiteColor,
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Dart', style: AppStyles.bold32(AppStyles.blackColor)),
                    Text('Master Class',
                        style: AppStyles.regular32(AppStyles.blackColor)),
                  ],
                ),
                SizedBox(
                  height: height * 0.1,
                  child: Image.asset(AppStyles.dart),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseGrid(
      double width, double height, List<Map<String, dynamic>> courses) {
    return Padding(
      padding: EdgeInsets.only(bottom: height * .06),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          childAspectRatio: 0.85,
        ),
        itemCount: courses.length + 1,
        itemBuilder: (context, index) {
          if (index == courses.length) {
            return _addCard(height, width);
          }
          final course = courses[index];
          return _courseCard(
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
    );
  }

  Widget _courseCard(double height, double width, String title, String subtitle,
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
                        AlwaysStoppedAnimation<Color>(AppStyles.whiteColor),
                  ),
                  CircularProgressIndicator(
                    strokeCap: StrokeCap.round,
                    value: progressPercentage / 100,
                    strokeWidth: 10,
                    valueColor: AlwaysStoppedAnimation(AppStyles.whiteColor),
                    backgroundColor: AppStyles.blackColor,
                  ),
                  Center(
                    child: Text('${progressPercentage.toInt()}',
                        style: AppStyles.bold24(AppStyles.whiteColor)),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppStyles.bold15(AppStyles.whiteColor)),
                    Text(subtitle,
                        style: AppStyles.regular15(AppStyles.whiteColor)),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: width * 0.04),
                  child: SizedBox(
                    height: height * 0.09,
                    width: width * 0.09,
                    child: Image.asset(image),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _addCard(double height, double width) {
    return Card(
      elevation: 10,
      color: AppStyles.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppStyles.grayColor,
                ),
                child: Icon(
                  Icons.add,
                  size: 40,
                  color: AppStyles.whiteColor,
                )),
            SizedBox(
              height: height * 0.01,
            ),
            Text('Add Course', style: AppStyles.bold15(AppStyles.grayColor)),
          ],
        ),
      ),
    );
  }
}
