import 'package:flutter/material.dart';
import 'package:language_translator/Screens/Home.dart';
import 'package:language_translator/Screens/Splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
    );
  }
}