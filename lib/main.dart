import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:raseeni/controller/app_user_controller.dart';
import 'firebase_options.dart';

import 'controller/onboarding_controller.dart';
import 'controller/profile_controller.dart';
import 'controller/bottomNavBarController.dart';
import 'controller/auth_controller.dart';
import 'controller/streak_controller.dart';
import 'controller/image_pick_contoller.dart';
import 'view/bottomNavBar.dart';
import 'view/onBoardingScreen.dart';

import 'model/appStyle.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final profileController = ProfileController();
  await profileController.initialize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppUser()),
        ChangeNotifierProvider(create: (_) => OnboardingController()),
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => ProfileController()),
        ChangeNotifierProvider(create: (_) => ProfileImageController()),
        ChangeNotifierProvider(create: (_) => BottomNavBarController()),
        ChangeNotifierProvider(create: (_) => StreakContoller()),
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
          ? OnboardingScreen()
          : BottomNavBar(),
    );
  }
}
