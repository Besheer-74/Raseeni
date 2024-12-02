import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:raseeni/controller/auth_controller.dart';
import 'package:raseeni/controller/streak_controller.dart';
import 'package:raseeni/view/auth/auth_email.dart';
import 'controller/chat_controller.dart';
import 'controller/image_pick_contoller.dart';
import 'firebase_options.dart';

import 'view/bottomNavBar.dart';
import 'model/appStyle.dart';
import 'controller/bottomNavBarController.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavBarController()),
        ChangeNotifierProvider(create: (_) => ChatController()),
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => StreakContoller()),
        ChangeNotifierProvider(create: (_) => Imagecontroller()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: AuthEmail(),
    );
  }
}
