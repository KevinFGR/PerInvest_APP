import 'package:flutter/material.dart';
import 'package:perinvest_app/helpers/toast.helper.dart';
import 'package:perinvest_app/services/cryptos.service.dart';
import 'package:perinvest_app/services/token.service.dart';


class CryptosController {
  static void navigateToListPage(BuildContext context) {
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => const ListPage()),
    // );
  }

  static Future<dynamic> getCriptos() async {
    CryptosService cryptosService =  CryptosService();
    dynamic res = await cryptosService.get();
    if(!res['success']) {
      ToastHelper.warning(res['message']);
      return res;
    }
    
    await TokenService.setToken(res['data']['token']);
    return res;
  }
}