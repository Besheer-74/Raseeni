import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/auth_controller.dart';
import '../../../model/appStyle.dart';
import 'auth_profile.dart';

class AuthPassword extends StatelessWidget {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    final _authController = Provider.of<AuthController>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05, vertical: height * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: height * 0.07),
              _buildPasswordField(_authController),
              SizedBox(height: height * 0.02),
              _buildConfirmPasswordField(_authController),
              SizedBox(height: height * 0.07),
              _buildNextButton(context, width, height, _passwordController.text,
                  _authController),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
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
      ],
    );
  }

  Widget _buildPasswordField(AuthController _authController) {
    return _buildInputField(
      label: "Password",
      controller: _passwordController,
      obscureText: _authController.isPasswordHidden,
      isValid: _authController.isPasswordValid,
      onChanged: _authController.validatePassword,
      toggleVisibility: _authController.togglePasswordVisibility,
    );
  }

  Widget _buildConfirmPasswordField(AuthController _authController) {
    return _buildInputField(
      label: "Confirm Password",
      controller: _confirmPasswordController,
      obscureText: _authController.isPasswordHidden,
      isValid: _authController.isPasswordValid,
      onChanged: _authController.validatePassword,
      toggleVisibility: _authController.togglePasswordVisibility,
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required bool obscureText,
    required bool isValid,
    required Function(String) onChanged,
    required VoidCallback toggleVisibility,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.regular16(
              isValid ? AppStyles.greenColor : AppStyles.maybeGray),
        ),
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

  Widget _buildNextButton(BuildContext context, double width, double height,
      String password, AuthController _authController) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          if (_authController.isPasswordValid) {
            _authController.setPassword(password);
            try {
              final user = await _authController
                  .registerUserWithEmailAndPassword(context);
              if (user != null) {
                _authController.setUserId(user.uid); // Store userId in provider
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AuthProfile(),
                  ),
                );
              }
            } catch (e) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Registration failed')));
            }
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
}
