import 'package:flutter/material.dart';
import 'package:perinvest_app/app/auth/auth.page.dart';
import 'package:perinvest_app/helpers/color.helper.dart';

void main() {
  runApp(const PerInvestApp());
}

class PerInvestApp extends StatelessWidget {
  const PerInvestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PerInvest',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorHelper.primary,
          brightness: Brightness.dark
          ),
      ),
      home: const LoginPage(),
    );
  }
}