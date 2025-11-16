import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:perinvest_app/environment/environment.dart';
import 'package:perinvest_app/helpers/perInvest.helper.dart';

class CryptosService{
  final  client = http.Client();
  Future get() async {
    final res =  await client.get(
      Uri.parse("${Environment.apiUrl}/cryptos"),
      headers: await PerInvestHelper.requestHeader()
    );
    return jsonDecode(res.body);
  }

  Future insert(Map<String, String> map) async {
    String body = jsonEncode(map);
    final res =  await client.post(
      Uri.parse("${Environment.apiUrl}/cryptos"),
      headers: await PerInvestHelper.requestHeader(),
      body: body
    );
    return jsonDecode(res.body);
  }
}