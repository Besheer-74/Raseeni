import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  bool _isEmailValid = false;
  bool _isPasswordHidden = true;
  bool _isFirstNameVaild = false;
  bool _isLastNameVaild = false;
  bool _isPhoneValid = false;
  bool _isPasswordValid = false;

  bool get isEmailValid => _isEmailValid;
  bool get isPasswordHidden => _isPasswordHidden;
  bool get isFirstNameVaild => _isFirstNameVaild;
  bool get isLastNameVaild => _isLastNameVaild;
  bool get isPhoneValid => _isPhoneValid;
  bool get isPasswordValid => _isPasswordValid;

  void validateEmail(String email) {
    _isEmailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    notifyListeners();
  }

  void validatePassword(String password) {
    // Ensure the password is at least 8 characters, contains at least one uppercase letter,
    // one lowercase letter, one digit, and one special character.
    _isPasswordValid = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    ).hasMatch(password);
    notifyListeners();
  }

  void validateFirstName(String firstName) {
    _isFirstNameVaild =
        RegExp(r"^[a-zA-Z]+([ '-][a-zA-Z]+)*$").hasMatch(firstName);

    notifyListeners();
  }

  void validateLastName(String lastName) {
    _isLastNameVaild =
        RegExp(r"^[a-zA-Z]+([ '-][a-zA-Z]+)*$").hasMatch(lastName);
    notifyListeners();
  }

  void validatePhoneNumber(String phoneNumber) {
    _isPhoneValid = RegExp(r'^\+?[0-9]{10,15}$').hasMatch(phoneNumber);
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _isPasswordHidden = !_isPasswordHidden;
    notifyListeners();
  }
}
