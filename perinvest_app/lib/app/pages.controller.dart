import 'package:flutter/material.dart';
import 'package:perinvest_app/helpers/toast.helper.dart';
import 'package:perinvest_app/services/cryptos.service.dart';


class PagesController extends ChangeNotifier{

  String title = "CRYPTOS";
  List<dynamic> cryptos = [];

  Future<void> getCryptos() async {
    CryptosService cryptosService =  CryptosService();
    dynamic res = await cryptosService.get();
    if(!res['success']) {
      ToastHelper.warning(res['message']);
      return;
    } else{
      cryptos = res['data'];
    }

    notifyListeners();
  }

  Widget getCryptosList(){
    List<Widget> cryptosList = [];
    for (var i = 0; i < cryptos.length; i++) {
      cryptosList.add(Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          // gradient: LinearGradient(
          //   begin: Alignment.centerLeft,
          //   end: Alignment.centerRight,
          //   colors: [
          //     Colors.grey[900]!,
          //     // Colors.amber[900]!,
          //   ],
            // stops: [0.8, 0.99]
          // ),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.amber.shade900,
            width: 0.3,             
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.amber.shade900.withValues(alpha:0.3),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 0)
            ),
          ],
        ),
        padding: const EdgeInsets.all(15),
        child:Text(cryptos[i]['description'])
      ));
      cryptosList.add(const SizedBox(height: 10));
    }

    notifyListeners();
    return ListView(children:cryptosList);
  }

  Color hexadecimalColor(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) hex = 'FF$hex';
    return Color(int.parse(hex, radix: 16));
  }
}