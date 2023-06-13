import 'package:flutter/material.dart';
import 'package:tiktok_app/features/authentication/sign_up_screen.dart';

void main() {
  runApp(const TickTokApp());
}

class TickTokApp extends StatelessWidget {
  const TickTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiktok App',
      theme: ThemeData(
        primaryColor: const Color(0xFFE9435A),
      ),
      home: const SignUpScreen(),
    );
  }
}
