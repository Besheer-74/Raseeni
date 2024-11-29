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

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: height * .1,
              decoration: BoxDecoration(
                color: appStyles.blueColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    appStyles.logo,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      appStyles.notification_none,
                      color: appStyles.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
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
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
