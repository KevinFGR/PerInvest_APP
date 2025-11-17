import 'package:flutter/cupertino.dart';
import 'package:perinvest_app/services/token.service.dart';

class PerInvestHelper{

  static Future<dynamic> requestHeader() async{
    String token = await TokenService.getToken() ?? ""; 
    return {
      'Content-Type': 'application/json', 
      'Authorization': "Bearer $token"
    };
  }

   static Color hexadecimalColor(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) hex = 'FF$hex';
    return Color(int.parse(hex, radix: 16));
  }
}