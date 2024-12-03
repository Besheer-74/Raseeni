import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../model/appStyle.dart';

class AuthController extends ChangeNotifier {
  // User details
  String? _email;
  String? _password;
  String? _firstName;
  String? _lastName;
  String? _username;
  String? _userId;

  // Profile image
  File? _profileImage;

  // Validation flags
  bool _isEmailValid = false;
  bool _isPasswordHidden = true;
  bool _isFirstNameValid = false;
  bool _isLastNameValid = false;
  bool _isPhoneValid = false;
  bool _isPasswordValid = false;

  // Getters
  String? get email => _email;
  String? get password => _password;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get username => _username;
  String? get userId => _userId;
  File? get profileImage => _profileImage;

  bool get isEmailValid => _isEmailValid;
  bool get isPasswordHidden => _isPasswordHidden;
  bool get isFirstNameValid => _isFirstNameValid;
  bool get isLastNameValid => _isLastNameValid;
  bool get isPhoneValid => _isPhoneValid;
  bool get isPasswordValid => _isPasswordValid;

  // Setters
  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void setFirstName(String firstName) {
    _firstName = firstName;
    notifyListeners();
  }

  void setLastName(String lastName) {
    _lastName = lastName;
    notifyListeners();
  }

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void setUserId(String userId) {
    _userId = userId;
    notifyListeners();
  }

  void setProfileImage(File image) {
    _profileImage = image;
    notifyListeners();
  }

  // Toggle password visibility
  void togglePasswordVisibility() {
    _isPasswordHidden = !_isPasswordHidden;
    notifyListeners();
  }

  // Validation methods
  void validateEmail(String email) {
    _isEmailValid = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,}$",
    ).hasMatch(email);
    notifyListeners();
  }

  void validatePassword(String password) {
    _isPasswordValid = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    ).hasMatch(password);
    notifyListeners();
  }

  void validateFirstName(String firstName) {
    _isFirstNameValid =
        RegExp(r"^[a-zA-Z]+([ '-][a-zA-Z]+)*$").hasMatch(firstName);
    notifyListeners();
  }

  void validateLastName(String lastName) {
    _isLastNameValid =
        RegExp(r"^[a-zA-Z]+([ '-][a-zA-Z]+)*$").hasMatch(lastName);
    notifyListeners();
  }

  // User registration
  Future<User?> registerUserWithEmailAndPassword(BuildContext context) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email!, password: _password!);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      final message = e.code == 'weak-password'
          ? 'The password provided is too weak!'
          : e.code == 'email-already-in-use'
              ? 'The account already exists for that email!'
              : 'An unknown error occurred.';
      _showSnackBar(context, message);
    } catch (e) {
      print('Error during registration: $e');
    }
    return null;
  }

  // Upload profile image to Firebase Storage
  Future<String?> uploadProfileImageToStorage(File image) async {
    try {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final storageRef =
          FirebaseStorage.instance.ref().child('profile_images/$fileName.jpg');
      final snapshot = await storageRef.putFile(image).whenComplete(() => null);
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  // Save user profile to Firestore
  Future<void> saveUserProfile(String userId) async {
    try {
      String? imageUrl;
      if (_profileImage != null) {
        imageUrl = await uploadProfileImageToStorage(_profileImage!);
      }
      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'email': _email,
        'firstName': _firstName,
        'lastName': _lastName,
        // 'username': _username,
        'image': imageUrl,
      });
    } catch (e) {
      print('Error saving profile: $e');
      throw e;
    }
  }

  // Helper method to show SnackBar
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppStyles.bold15(AppStyles.whiteColor),
        ),
        duration: const Duration(seconds: 3),
        backgroundColor: AppStyles.greenColor,
      ),
    );
  }

  // User Login
  Future<void> loginUser(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print("Login successful!");
      fetchUserdata();
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  // Fetch Data
  Future<void> fetchUserdata() async {
    var userData =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    _firstName = userData.get('firstName');
    _lastName = userData.get('lastName');
    _email = userData.get('email');
  }

  // Logout
  Future<void> logoutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      print("Logout successful!");
    } catch (e) {
      throw Exception('Logout failed: $e');
    }
  }
}
