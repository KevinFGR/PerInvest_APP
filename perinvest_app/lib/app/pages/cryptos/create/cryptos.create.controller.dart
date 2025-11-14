import 'package:flutter/material.dart';
import 'package:perinvest_app/app/pages.dart';

class CryptosCreateController extends ChangeNotifier{

  List<dynamic> cryptos = [];
  bool isLoading = true;
  static void backToPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Pages()),
    );
  }
}