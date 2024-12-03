import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'auth_controller.dart';

class ProfileImageController extends ChangeNotifier {
  File? profileImage;

  File? get imagePiced => profileImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(AuthController authController) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      authController.setProfileImage(profileImage!);
      notifyListeners();
    }
  }

  void clearImage() {
    profileImage = null;
    notifyListeners();
  }
}
