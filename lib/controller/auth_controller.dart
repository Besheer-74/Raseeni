// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../view/authentication/signup_proccess/auth_profile.dart';
import '../view/bottomNavBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/firebase_service.dart';
import 'profile_controller.dart';

class AuthController extends ChangeNotifier {
  String? _email;
  String? _password;
  String? _userId;
  bool _isPasswordHidden = true;

  // Getters
  String? get email => _email;
  String? get password => _password;
  String? get userId => _userId;
  bool get isPasswordHidden => _isPasswordHidden;

  // Setters
  void setEmail(String email) {
    _email = email;
    print(email);
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    print(password);
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _isPasswordHidden = !_isPasswordHidden;
    notifyListeners();
  }

  // Register user
  Future<void> registerUser(BuildContext context) async {
    if (_email == null ||
        _email!.isEmpty ||
        _password == null ||
        _password!.isEmpty) {
      _showSnackBar(context, 'Email and password must not be empty.');
      return;
    }
    print('Email: $_email, Password: $_password');
    try {
      final user = await FirebaseService.registerUserWithEmailAndPassword(
        email: _email!,
        password: _password!,
      );
      if (user != null) {
        _userId = user.uid;
        await FirebaseService.saveUserProfile(
          userId: _userId!,
          email: _email!,
          firstName: '',
          lastName: '',
        );

        _showSnackBar(context, 'Registration successful!');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => AuthProfile()),
          (route) => false,
        );
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          _showSnackBar(context, 'Email is already in use.');
        } else if (e.code == 'weak-password') {
          _showSnackBar(context, 'The password is too weak.');
        } else if (e.code == 'invalid-email') {
          _showSnackBar(context, 'Invalid email format.');
        } else {
          _showSnackBar(context, 'An error occurred: ${e.message}');
        }
      } else {
        _showSnackBar(context, 'An unexpected error occurred: ${e.toString()}');
      }
    }
  }

  Future<void> loginUser(
    BuildContext context,
    ProfileController profileController,
  ) async {
    try {
      final user = await FirebaseService.loginUser(
        email: _email!,
        password: _password!,
      );
      if (user != null) {
        _userId = user.uid;

        // Fetch user data and save to SharedPreferences
        await fetchUserData(profileController);

        _showSnackBar(context, 'Login successful!');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => BottomNavBar()),
          (route) => false, // Removes all previous routes
        );
      } else {
        _showSnackBar(context, 'Failed to Login.');
      }
    } catch (e) {
      _showSnackBar(context, e.toString());
    }
  }

  Future<void> logoutUser() async {
    await FirebaseService.logoutUser();
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    notifyListeners();
  }

  Future<void> updateUserName(ProfileController _profileController,
      String firstName, String lastName) async {
    try {
      // Update Firestore
      if (_userId == null) {
        throw Exception("User ID is null. Unable to update name.");
      }

      await FirebaseService.updateUserName(
        userId: _userId!,
        firstName: firstName,
        lastName: lastName,
      );

      // Notify ProfileController
      _profileController.setFirstName(firstName);
      _profileController.setLastName(lastName);

      // Update SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('first_name', firstName);
      await prefs.setString('last_name', lastName);
    } catch (e) {
      debugPrint('Error updating user name: $e');
      throw e;
    }
  }

  // Fetch data from Firestore
  Future<void> fetchUserData(ProfileController profileController) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) throw Exception("User not logged in");

      _userId = user.uid;

      // Fetch data from Firestore
      final data = await FirebaseService.getUserProfile(_userId!);

      final firstName = data['firstName'] as String?;
      final lastName = data['lastName'] as String?;
      final email = data['email'] as String?;

      // Update local state
      _email = email;
      notifyListeners();

      // Update ProfileController
      profileController.setFirstName(firstName ?? '');
      profileController.setLastName(lastName ?? '');

      // Save to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_id', _userId!);
      await prefs.setString('email', _email ?? '');
      if (firstName != null) await prefs.setString('first_name', firstName);
      if (lastName != null) await prefs.setString('last_name', lastName);

      debugPrint(
          "Saved to SharedPreferences: firstName=$firstName, lastName=$lastName");
    } catch (e) {
      debugPrint('Error fetching user data: $e');
      throw e;
    }
  }

  Future<void> initialize(ProfileController profileController) async {
    final prefs = await SharedPreferences.getInstance();
    _userId = prefs.getString('user_id');
    _email = prefs.getString('email');

    debugPrint("Loaded from SharedPreferences: userId=$_userId, email=$_email");

    if (_userId != null) {
      final firstName = prefs.getString('first_name');
      final lastName = prefs.getString('last_name');

      debugPrint("Loaded names: firstName=$firstName, lastName=$lastName");

      if (firstName != null && lastName != null) {
        profileController.setFirstName(firstName);
        profileController.setLastName(lastName);
      } else {
        // Fallback to fetch data from Firestore
        await fetchUserData(profileController);
      }
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.green,
      ),
    );
  }
}
