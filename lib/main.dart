import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controller/profile_controller.dart';
import 'firebase_options.dart';

import 'controller/auth_controller.dart';
import 'controller/streak_controller.dart';
import 'view/authentication/login_screen.dart';
import 'controller/chat_controller.dart';
import 'controller/image_pick_contoller.dart';
import 'view/bottomNavBar.dart';
import 'model/appStyle.dart';
import 'controller/bottomNavBarController.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final profileController = ProfileController();
  final authController = AuthController();

  await profileController.initialize();

  // Make sure the initialize method is called after profileController is created
  await profileController
      .initialize(); // This should load the data from SharedPreferences
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => ProfileController()),
        ChangeNotifierProvider(create: (_) => ProfileImageController()),
        ChangeNotifierProvider(create: (_) => BottomNavBarController()),
        ChangeNotifierProvider(create: (_) => StreakContoller()),
        ChangeNotifierProvider(create: (_) => ChatController()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppStyles.blueColor, // Change to your app bar color
        statusBarIconBrightness: Brightness.light, // Set to light or dark
      ),
    );
    return MaterialApp(
      title: 'Rasseni',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppStyles.whiteColor,
        fontFamily: 'IBM Plex Sans',
        useMaterial3: true,
      ),
      home: FirebaseAuth.instance.currentUser == null
          ? LoginScreen()
          : BottomNavBar(),
    );
  }
}
