import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controller/chat_controller.dart';
import 'firebase_options.dart';

import 'view/bottomNavBar.dart';
import 'model/appStyle.dart';
import 'controller/bottomNavBarController.dart';
import 'view/view_chat_screen.dart';
import 'view/view_dashboard_screen.dart';

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
        statusBarColor: appStyles.blueColor, // Change to your app bar color
        statusBarIconBrightness: Brightness.light, // Set to light or dark
      ),
    );
    return MaterialApp(
      title: 'Rasseni',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: appStyles.whiteColor,
        fontFamily: 'IBM Plex Sans',
        useMaterial3: true,
      ),
      home: BottomNavBar(),
    );
  }
}
