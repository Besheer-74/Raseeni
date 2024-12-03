import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raseeni/view/authentication/signup_proccess/auth_email.dart';
import 'package:raseeni/view/bottomNavBar.dart';

import '../../controller/auth_controller.dart';
import '../../model/appStyle.dart';

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;

    final _authController = Provider.of<AuthController>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            right: width * 0.05,
            top: height * 0.08,
            left: width * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back!👋",
                style: AppStyles.bold40(AppStyles.indigoColor),
              ),
              Text(
                "Please Sign-in to \nyour account",
                style: AppStyles.medium32(AppStyles.blackColor),
              ),
              SizedBox(height: height * 0.07),
              _buildInputLabel(
                "Email Address",
                isValid: _authController.isEmailValid,
              ),
              // SizedBox(height: height * 0.007),
              _buildEmailField(_authController),
              SizedBox(height: height * 0.04),
              _buildInputLabel(
                "Password",
                isValid: _authController.isPasswordValid,
              ),
              // SizedBox(height: height * 0.007),
              _buildPasswordField(_authController),
              SizedBox(height: height * 0.1),
              _buildNextButton(
                width,
                height,
                _emailController.text,
                _passwordController.text,
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

  Widget _buildPasswordField(AuthController _authController) {
    return _buildInputField(
      controller: _passwordController,
      obscureText: _authController.isPasswordHidden,
      isValid: _authController.isPasswordValid,
      onChanged: _authController.validatePassword,
      toggleVisibility: _authController.togglePasswordVisibility,
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required bool obscureText,
    required bool isValid,
    required Function(String) onChanged,
    required VoidCallback toggleVisibility,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.0),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          onChanged: onChanged,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
              onPressed: toggleVisibility,
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: isValid ? AppStyles.greenColor : AppStyles.maybeGray,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: isValid ? AppStyles.greenColor : AppStyles.maybeGray,
                width: 1.5,
              ),
            ),
          ),
          style: AppStyles.regular20(AppStyles.blackColor),
        ),
      ],
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
      String password, AuthController _authController, BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          if (_authController.isEmailValid) {
            _authController.loginUser(email, password);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => BottomNavBar()),
              ModalRoute.withName('/'),
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
              builder: (BuildContext context) => AuthEmail(),
            ),
            ModalRoute.withName('/'),
          );
        },
        child: Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            text: "Don’t have an account?\n",
            style: AppStyles.regular24(AppStyles.blackColor),
            children: [
              TextSpan(
                text: "Sign up",
                style: AppStyles.regular24(AppStyles.indigoColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
