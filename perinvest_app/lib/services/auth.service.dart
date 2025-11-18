import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:perinvest_app/environment/environment.dart';

class AuthService{
  static Future auth(Map<String, dynamic> data) async {
    final  client = http.Client();
    String requestBody = jsonEncode(data);
    final res =  await client.post(Uri.parse("${Environment.apiUrl}/auth"), body:requestBody, headers: {
      'Content-Type': 'application/json', 
    });
    return jsonDecode(res.body);
  }
}