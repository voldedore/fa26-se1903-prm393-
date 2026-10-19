import 'package:flutter/material.dart';
import 'package:theme_data/app_theme.dart';
import 'package:theme_data/registration_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.create(.light), // theme = light mode
      darkTheme: AppTheme.create(.dark), // darkTheme = dark mode
      themeMode: .system,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Theme Data',
            // Local style cho rieng widget Text
            // style: TextStyle(
            //   color: Colors.orange,
            //   fontSize: 36,
            //   fontWeight: .bold,
            // ),
          ),
        ),
        body: RegistrationScreen(),
      ),
    );
  }
}
