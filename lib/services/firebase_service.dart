import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {

  // Register
  static Future<User?> registerUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  // Save data to Firestore
  static Future<void> saveUserProfile({
    required String userId,
    required String email,
    required String firstName,
    required String lastName,
  }) async {
    await FirebaseFirestore.instance.collection('users').doc(userId).set({
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
    });
  }

  // Get user data from Firestore
  static Future<Map<String, dynamic>> getUserProfile(String userId) async {
    final doc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    if (doc.exists) {
      return doc.data() ?? {};
    } else {
      throw Exception('User not found');
    }
  }

  static Future<User?> loginUser({
    required String email,
    required String password,
  }) async {
    final userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  static Future<void> logoutUser() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<void> updateUserName({
    required String userId,
    required String firstName,
    required String lastName,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'firstName': firstName,
        'lastName': lastName,
      });
    } catch (e) {
      throw Exception('Error updating name in Firestore: $e');
    }
  }
}
