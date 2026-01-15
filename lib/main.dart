import 'package:anitgapp/screens/registration_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6A11CB)),
        useMaterial3: true,
      ),
      home: const RegistrationScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
