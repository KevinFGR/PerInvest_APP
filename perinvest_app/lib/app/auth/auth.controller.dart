import 'package:flutter/material.dart';
import 'package:perinvest_app/app/pages/pages.dart';
import 'package:perinvest_app/helpers/toast.helper.dart';
import 'package:perinvest_app/services/auth.service.dart';
import 'package:perinvest_app/services/token.service.dart';



class LoginController {
  static void openPages(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Pages()),
    );
  }

  static Future<bool> auth(String email, String pass) async {
    final Map<String, dynamic> body = {
      'email': email,
      'password': pass,
    };
    dynamic res = await AuthService.auth(body);
    if(!res['success']) {
      ToastHelper.warning(res['message']);
      return false;
    }
    
    await TokenService.setToken(res['data']['token']);
    return true;
  }
}