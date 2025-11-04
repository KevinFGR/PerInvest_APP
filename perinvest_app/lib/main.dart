import 'package:flutter/material.dart';
import 'package:perinvest_app/app/auth/auth.page.dart';

void main() {
  runApp(const PerInvestApp());
}

class PerInvestApp extends StatelessWidget {
  const PerInvestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PerInvest',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark
          ),
      ),
      home: const LoginPage(),
    );
  }
}