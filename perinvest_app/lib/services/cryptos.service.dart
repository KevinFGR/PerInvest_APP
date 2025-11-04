import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:perinvest_app/environment/environment.dart';
import 'package:perinvest_app/services/token.service.dart';

class CryptosService{
  final  client = http.Client();
  Future get() async {
    String token = await TokenService.getToken() ?? ""; 
    final res =  await client.get(
      Uri.parse("${Environment.apiUrl}/cryptos"),
      headers: {
        'Content-Type': 'application/json', 
        'Authorization': "Bearer $token"
      }
    );
    return jsonDecode(res.body);
  }
}