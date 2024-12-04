import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raseeni/controller/app_user_controller.dart';
import 'package:raseeni/model/appStyle.dart';

class AddCourseScreen extends StatelessWidget {
  const AddCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AppUser>(
        builder: (context, user, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView.builder(
                itemCount: user.theCoursesList.length,
                itemBuilder: (context, index) {
                  return Card(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      color: AppStyles.maybeBlueColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35))),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              user.theCoursesList[index].name,
                              style: AppStyles.semiBold24(AppStyles.whiteColor),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.add,
                                size: 24,
                                color: AppStyles.whiteColor,
                              ),
                              onPressed: () {
                                user.addCourse(user.theCoursesList[index]);
                              },
                            )
                          ],
                        ),
                      ));
                }),
          );
        },
      ),
    );
  }
}
