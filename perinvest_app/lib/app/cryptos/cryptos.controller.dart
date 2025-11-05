import 'package:flutter/material.dart';
import 'package:perinvest_app/helpers/toast.helper.dart';
import 'package:perinvest_app/services/cryptos.service.dart';


class CryptosController extends ChangeNotifier{

  String teste = "Teste";
  List<dynamic> cryptos = [];
  static void navigateToListPage(BuildContext context) {
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => const ListPage()),
    // );
  }

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
      Color cryptoColor = hexadecimalColor(cryptos[i]['color']);
      cryptosList.add(Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              cryptoColor,
              Colors.grey[900]!,
            ],
          ),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: cryptoColor,
            width: 0.3,             
          ),
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