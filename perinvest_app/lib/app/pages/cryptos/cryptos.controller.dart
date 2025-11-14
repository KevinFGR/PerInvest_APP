import 'package:flutter/material.dart';
import 'package:perinvest_app/app/pages/cryptos/create/cryptos.create.page.dart';
import 'package:perinvest_app/helpers/toast.helper.dart';
import 'package:perinvest_app/services/cryptos.service.dart';


class CryptosController extends ChangeNotifier{

  List<dynamic> cryptos = [];
  bool isLoading = true;
  static void goToCreate(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const CryptosCreatePage()),
    );
  }

  Future<void> getCryptos() async {
    isLoading = true;
    CryptosService cryptosService =  CryptosService();
    dynamic res = await cryptosService.get();
    if(!res['success']) {
      ToastHelper.warning(res['message']);
    } else{
      cryptos = res['data'];
    }
    isLoading = false;
    notifyListeners();
  }

  List<Widget> getCryptosList(BuildContext context){
    List<Widget> cryptosList = [];
    for (var i = 0; i < cryptos.length; i++) {
      cryptosList.add(SizedBox(
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.centerLeft,
              colors: [
                Colors.grey.shade900,
                Colors.amber.shade900,
              ],
              stops: [0.8, 0.99]
            ),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.amber[900]!,
              width: 0.5,             
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
          child:GestureDetector(
            onTap: () => CryptosController.goToCreate(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(cryptos[i]['description']),
                const Icon(Icons.arrow_forward_ios, size: 15, color: Colors.grey),
              ]
            )
          )
        )
      ));
      cryptosList.add(const SizedBox(height: 20));
    }
    
    notifyListeners();
    return cryptosList;
  }

  Color hexadecimalColor(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) hex = 'FF$hex';
    return Color(int.parse(hex, radix: 16));
  }
}