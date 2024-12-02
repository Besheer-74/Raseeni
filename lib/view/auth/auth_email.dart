import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raseeni/view/auth/auth_password.dart';

import '../../controller/auth_controller.dart';
import '../../model/appStyle.dart';

class AuthEmail extends StatelessWidget {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    final signUpProvider = Provider.of<AuthController>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: width * 0.05,
            right: width * 0.05,
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.08),
                  Text(
                    "Hi, Welcome!👋",
                    style: AppStyles.bold40(AppStyles.indigoColor),
                  ),
                  Text(
                    "Please enter your \nemail address",
                    style: AppStyles.medium32(AppStyles.blackColor),
                  ),
                  SizedBox(height: height * 0.07),
                  Text(
                    "Email Address",
                    style: AppStyles.medium16(signUpProvider.isEmailValid
                        ? AppStyles.greenColor
                        : AppStyles.maybeGray),
                  ),
                  SizedBox(height: height * 0.007),
                  TextFormField(
                    controller: _emailController,
                    onChanged: (email) => signUpProvider.validateEmail(email),
                    decoration: InputDecoration(
                      hintText: "rasseni@gmail.com",
                      hintStyle: AppStyles.regular16(AppStyles.grayColor),
                      suffixIcon: signUpProvider.isEmailValid
                          ? Icon(Icons.check_circle,
                              color: AppStyles.greenColor)
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
                    height: height * 0.2,
                  ),
                  _buildNextButton(width, height, context)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNextButton(
      double width, double height, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => AuthPassword(),
              ),
            );
          },
          child: Container(
            width: width * .5,
            height: height * 0.06,
            decoration: BoxDecoration(
              color: AppStyles.greenColor,
              borderRadius: BorderRadius.circular(35),
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
