import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raseeni/view/authentication/login_screen.dart';
import '../../../controller/auth_controller.dart';
import '../../../model/appStyle.dart';
import 'auth_password.dart';

class AuthEmail extends StatelessWidget {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;

    final _authController = Provider.of<AuthController>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.05, vertical: height * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, Welcome!👋",
                  style: AppStyles.bold40(AppStyles.indigoColor),
                ),
                Text(
                  "Please enter your \nemail address",
                  style: AppStyles.medium32(AppStyles.blackColor),
                ),
                SizedBox(height: height * 0.07),
                _buildInputLabel(
                  "Email Address",
                  isValid: _authController.isEmailValid,
                ),
                SizedBox(height: height * 0.007),
                _buildEmailField(_authController),
                SizedBox(height: height * 0.15),
                _buildNextButton(
                  width,
                  height,
                  _emailController.text,
                  _authController,
                  context,
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                
                _buildTextHaveAcc(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputLabel(String text, {required bool isValid}) {
    return Text(
      text,
      style: AppStyles.medium16(
        isValid ? AppStyles.greenColor : AppStyles.maybeGray,
      ),
    );
  }

  Widget _buildEmailField(AuthController _authController) {
    return TextFormField(
      controller: _emailController,
      onChanged: (email) => _authController.validateEmail(email),
      decoration: InputDecoration(
        hintText: "rasseni@gmail.com",
        hintStyle: AppStyles.regular16(AppStyles.grayColor),
        suffixIcon: _authController.isEmailValid
            ? Icon(Icons.check_circle, color: AppStyles.greenColor)
            : null,
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: _authController.isEmailValid
                ? AppStyles.greenColor
                : AppStyles.grayColor,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: _authController.isEmailValid
                ? AppStyles.greenColor
                : AppStyles.grayColor,
            width: 1.5,
          ),
        ),
      ),
      style: AppStyles.regular20(AppStyles.blackColor),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildNextButton(double width, double height, String email,
      AuthController _authController, BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          if (_authController.isEmailValid) {
            _authController.setEmail(email);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AuthPassword(),
              ),
            );
          }
        },
        child: Container(
          width: width * 0.5,
          height: height * 0.06,
          decoration: BoxDecoration(
            color: AppStyles.greenColor,
            borderRadius: BorderRadius.circular(35),
          ),
          child: Center(
            child: Text(
              "Next",
              style: AppStyles.medium20(AppStyles.whiteColor),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextHaveAcc(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => LoginScreen(),
            ),
            ModalRoute.withName('/'),
          );
        },
        child: Text.rich(
          TextSpan(
            text: "Already registered?\n",
            style: AppStyles.regular24(AppStyles.blackColor),
            children: [
              TextSpan(
                text: "Click Here To Login",
                style: AppStyles.regular24(AppStyles.indigoColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
