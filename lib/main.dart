import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
    );
  }
}
