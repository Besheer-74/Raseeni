import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raseeni/view/bottomNavBar.dart';
import 'controller/bottomNavBarController.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Bottomnavbarcontroller()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raseeni',
      theme: ThemeData(
        fontFamily: 'IBM Plex Sans',
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
