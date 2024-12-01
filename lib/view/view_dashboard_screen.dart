import 'package:flutter/material.dart';

import '../model/appStyle.dart';

class ViewDashboardScreen extends StatelessWidget {
  const ViewDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;

    List<Map<String, dynamic>> softSkills = [
      {
        "title": "Presentation skils",
        "image": "",
      },
      {
        "title": "Work on a Team Master Class",
        "image": "",
      },
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // App Bar
            Container(
              width: double.infinity,
              height: height * .09,
              decoration: BoxDecoration(
                color: AppStyles.blueColor,
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
                            onPressed: () {},
                            icon: Icon(
                              AppStyles.back,
                              color: AppStyles.whiteColor,
                            )),
                        Text("Soft Skills",
                            style: AppStyles.regular32(AppStyles.blackColor)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.05),
                    child: Image.asset(
                      AppStyles.skills,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.only(left: width * 0.03, right: width * 0.03),
                child: ListView.builder(
                  itemCount: softSkills.length,
                  itemBuilder: (context, index) {
                    final _softSkill = softSkills[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: height * 0.02),
                      child: coursesCard(
                        height,
                        width,
                        _softSkill['title'],
                      ),
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

  Widget coursesCard(double height, double width, String title) {
    return Container(
      width: double.infinity,
      height: height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: AppStyles.grayColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            height: height * 0.06,
            decoration: const BoxDecoration(
              color: AppStyles.indigoColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.04),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: AppStyles.medium16(AppStyles.indigoColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
