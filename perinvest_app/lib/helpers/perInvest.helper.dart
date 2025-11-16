import 'package:perinvest_app/services/token.service.dart';

class PerInvestHelper{

  static Future<dynamic> requestHeader() async{
    String token = await TokenService.getToken() ?? ""; 
    return {
      'Content-Type': 'application/json', 
      'Authorization': "Bearer $token"
    };
  }
}