import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raseeni/controller/auth_controller.dart';
import 'package:raseeni/model/appStyle.dart';
import 'package:raseeni/view/bottomNavBar.dart';

import '../../controller/image_pick_contoller.dart';

class AuthProfile extends StatelessWidget {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    final signUpProvider = Provider.of<AuthController>(context);
    final imageProvider = Provider.of<Imagecontroller>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: width * 0.03,
              right: width * 0.03,
              top: height * 0.05,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff6339FF),
                    ),
                    text: "Complete",
                    children: [
                      TextSpan(
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff121619),
                          ),
                          text: " your \nprofile"),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.03),
                Center(
                  child: CircleAvatar(
                    radius: width * 0.2,
                    backgroundColor: AppStyles.indigoColor,
                    child: CircleAvatar(
                      radius: width * 0.19,
                      backgroundColor: AppStyles.whiteColor,
                      child: imageProvider.image == null
                          ? IconButton(
                              onPressed: () {
                                imageProvider.pickImage();
                              },
                              icon: Icon(
                                AppStyles.person,
                                color: AppStyles.indigoColor,
                                size: width * 0.3,
                              ),
                            )
                          : Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: FileImage(imageProvider.image!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        color: Color(0xff5063BF),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: IconButton(
                                      onPressed: imageProvider.pickImage,
                                      icon: Icon(
                                        Icons.edit,
                                        size: 28,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.04),
                Text(
                  "First Name",
                  style: AppStyles.medium16(signUpProvider.isEmailValid
                      ? AppStyles.greenColor
                      : AppStyles.maybeGray),
                ),
                SizedBox(height: height * 0.007),
                TextFormField(
                  controller: _firstName,
                  onChanged: (email) => signUpProvider.validateEmail(email),
                  decoration: InputDecoration(
                    hintText: "Walid",
                    hintStyle: AppStyles.regular16(AppStyles.grayColor),
                    suffixIcon: signUpProvider.isEmailValid
                        ? Icon(Icons.check_circle, color: AppStyles.greenColor)
                        : null,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: signUpProvider.isEmailValid
                            ? AppStyles.greenColor
                            : AppStyles.grayColor,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: signUpProvider.isEmailValid
                            ? AppStyles.greenColor
                            : AppStyles.grayColor,
                        width: 1.5,
                      ),
                    ),
                  ),
                  style: AppStyles.regular20(AppStyles.blackColor),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: height * 0.04),
                Text(
                  "First Name",
                  style: AppStyles.medium16(signUpProvider.isEmailValid
                      ? AppStyles.greenColor
                      : AppStyles.maybeGray),
                ),
                SizedBox(height: height * 0.007),
                TextFormField(
                  controller: _firstName,
                  onChanged: (email) => signUpProvider.validateEmail(email),
                  decoration: InputDecoration(
                    hintText: "Beshrer",
                    hintStyle: AppStyles.regular16(AppStyles.grayColor),
                    suffixIcon: signUpProvider.isEmailValid
                        ? Icon(Icons.check_circle, color: AppStyles.greenColor)
                        : null,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: signUpProvider.isEmailValid
                            ? AppStyles.greenColor
                            : AppStyles.grayColor,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: signUpProvider.isEmailValid
                            ? AppStyles.greenColor
                            : AppStyles.grayColor,
                        width: 1.5,
                      ),
                    ),
                  ),
                  style: AppStyles.regular20(AppStyles.blackColor),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                _buildNextButton(width, height, context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNextButton(double width, double height, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => BottomNavBar(),
              ),
            );
          },
          child: Container(
            width: width * .5,
            height: height * 0.06,
            decoration: BoxDecoration(
              color: AppStyles.greenColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child:
                  Text("Next", style: AppStyles.medium20(AppStyles.whiteColor)),
            ),
          ),
        ),
      ],
    );
  }
}
