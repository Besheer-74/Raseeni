import 'package:flutter/material.dart';
import '../model/appStyle.dart';

class DoneCourses extends StatelessWidget {
  const DoneCourses({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;

    List<Map<String, dynamic>> doneCourses = [
      {
        'title': 'Java',
        'subtitle': 'Master Class',
        'image': appStyles.java,
        'progress': 100,
        'color': appStyles.greenColor,
      },
      {
        'title': 'Java Script',
        'subtitle': 'Master Class',
        'image': appStyles.js,
        'progress': 100,
        'color': appStyles.blueColor,
      },
      {
        'title': 'Kotlin',
        'subtitle': 'Master Class',
        'image': appStyles.kotlin,
        'progress': 100,
        'color': appStyles.roseColor,
      },
      {
        'title': 'CSS',
        'subtitle': 'Master Class',
        'image': appStyles.css,
        'progress': 100,
        'color': appStyles.orangeColor,
      },
      {
        'title': 'C#',
        'subtitle': 'Master Class',
        'image': appStyles.csharp,
        'progress': 100,
        'color': appStyles.greenColor,
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(height, width, context),
            // SizedBox(height: height * 0.02),
            Expanded(
              // Wrap ListView in Expanded
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: ListView.builder(
                  itemCount: doneCourses.length,
                  itemBuilder: (context, index) {
                    final _doneCourses = doneCourses[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: height * 0.02),
                      child: _coursesDoneCard(
                          height,
                          width,
                          _doneCourses['progress'],
                          _doneCourses['title'],
                          _doneCourses['subtitle'],
                          _doneCourses['image'],
                          _doneCourses['color']),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(double height, double width, BuildContext context) {
    return Container(
      width: double.infinity,
      height: height * .09,
      decoration: BoxDecoration(
        color: appStyles.greenColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(35),
          bottomLeft: Radius.circular(35),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      appStyles.back,
                      color: appStyles.whiteColor,
                    )),
                Text(
                  "Done Courses",
                  style: appStyles.titleWhite,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _coursesDoneCard(double height, double width, int progressPercentage,
    String title, String subtitle, String image, Color color) {
  return Card(
    elevation: 10,
    color: color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(35),
    ),
    child: Padding(
      padding: EdgeInsets.only(
        left: width * 0.08,
        top: height * 0.03,
        bottom: height * 0.01,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          AlwaysStoppedAnimation<Color>(appStyles.whiteColor),
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
          SizedBox(height: height * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: appStyles.titleWhiteBold),
                  Text(subtitle, style: appStyles.subTitleWhite),
                ],
              ),
              SizedBox(
                height: height * 0.1,
                width: width * 0.4,
                child: Image.asset(
                  image,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
