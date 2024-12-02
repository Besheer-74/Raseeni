import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/auth_controller.dart';
import '../../model/appStyle.dart';
import 'aut_profile.dart';

class AuthPassword extends StatelessWidget {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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
            top: height * 0.08,
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Please enter your",
                    style: AppStyles.bold40(AppStyles.blackColor),
                  ),
                  Text(
                    "password",
                    style: AppStyles.medium32(AppStyles.indigoColor),
                  ),
                  SizedBox(height: height * 0.07),
                  Text(
                    "Password",
                    style: AppStyles.regular16(signUpProvider.isPasswordValid
                        ? AppStyles.greenColor
                        : AppStyles.maybeGray),
                  ),
                  SizedBox(height: height * 0.007),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: signUpProvider.isPasswordHidden,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(signUpProvider.isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: signUpProvider.togglePasswordVisibility,
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: signUpProvider.isPasswordValid
                              ? AppStyles.greenColor
                              : AppStyles.maybeGray,
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: signUpProvider.isPasswordValid
                              ? AppStyles.greenColor
                              : AppStyles.maybeGray,
                          width: 1.5,
                        ),
                      ),
                    ),
                    style: AppStyles.regular20(AppStyles.blackColor),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: height * 0.02),
                  Text(
                    "Confirm Password",
                    style: AppStyles.regular16(signUpProvider.isPasswordValid
                        ? AppStyles.greenColor
                        : AppStyles.maybeGray),
                  ),
                  SizedBox(height: height * 0.007),
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: signUpProvider.isPasswordHidden,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(signUpProvider.isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: signUpProvider.togglePasswordVisibility,
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: signUpProvider.isPasswordValid
                              ? AppStyles.greenColor
                              : AppStyles.maybeGray,
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: signUpProvider.isPasswordValid
                              ? AppStyles.greenColor
                              : AppStyles.maybeGray,
                          width: 1.5,
                        ),
                      ),
                    ),
                    style: AppStyles.regular20(AppStyles.blackColor),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  _buildViewAllButton(width, height, context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildViewAllButton(
      double width, double height, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => AuthProfile(),
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
