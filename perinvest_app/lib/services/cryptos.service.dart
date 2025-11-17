import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:perinvest_app/environment/environment.dart';
import 'package:perinvest_app/helpers/perInvest.helper.dart';

class CryptosService{
  static Future get() async {
    final  client = http.Client();
    final res =  await client.get(
      Uri.parse("${Environment.apiUrl}/cryptos"),
      headers: await PerInvestHelper.requestHeader()
    );
    return jsonDecode(res.body);
  }

  static Future getById(String id) async {
    final  client = http.Client();
    final res =  await client.get(
      Uri.parse("${Environment.apiUrl}/cryptos?id=$id"),
      headers: await PerInvestHelper.requestHeader()
    );
    return jsonDecode(res.body);
  }

  static Future insert(Map<String, String> map) async {
    final  client = http.Client();
    String body = jsonEncode(map);
    final res =  await client.post(
      Uri.parse("${Environment.apiUrl}/cryptos"),
      headers: await PerInvestHelper.requestHeader(),
      body: body
    );
    return jsonDecode(res.body);
  }
}