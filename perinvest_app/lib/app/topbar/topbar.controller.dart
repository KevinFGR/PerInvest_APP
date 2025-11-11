import 'package:flutter/material.dart';
import 'package:perinvest_app/app/auth/auth.page.dart';


class TopbarController extends ChangeNotifier{

  String teste = "Teste";
  bool isLoading = true;

  static void logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }


}