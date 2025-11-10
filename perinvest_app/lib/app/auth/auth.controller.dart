import 'package:flutter/material.dart';
import 'package:perinvest_app/app/cryptos/cryptos.page.dart';
import 'package:perinvest_app/app/pages.dart';
import 'package:perinvest_app/helpers/toast.helper.dart';
import 'package:perinvest_app/services/auth.service.dart';
import 'package:perinvest_app/services/token.service.dart';



class LoginController {
  static void openCryptosPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      // MaterialPageRoute(builder: (context) => const CryptosPage()),
      MaterialPageRoute(builder: (context) => const Pages()),
    );
  }

  static Future<bool> auth(String email, String pass) async {
    final Map<String, dynamic> body = {
      'email': email,
      'password': pass,
    };
    AuthService authService =  AuthService();
    dynamic res = await authService.auth(body);
    if(!res['success']) {
      ToastHelper.warning(res['message']);
      return false;
    }
    
    await TokenService.setToken(res['data']['token']);
    return true;
  }
}