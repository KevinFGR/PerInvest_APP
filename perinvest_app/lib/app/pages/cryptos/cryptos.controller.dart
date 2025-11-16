import 'package:flutter/material.dart';
import 'package:perinvest_app/app/pages/cryptos/form/cryptos.form.page.dart';
import 'package:perinvest_app/helpers/color.helper.dart';
import 'package:perinvest_app/helpers/toast.helper.dart';
import 'package:perinvest_app/services/cryptos.service.dart';


class CryptosController extends ChangeNotifier{

  List<dynamic> cryptos = [];
  bool isLoading = true;

  Function(Widget)? callbackPage;

  void initCallback(Function(Widget) func) {
    callbackPage = func;
  }

  static void goToCreate(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const CryptosFormPage()),
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
        child: GestureDetector(
          onTap: () => callbackPage?.call(CryptosFormPage()),
          child: Container(
            decoration: BoxDecoration(
              color: ColorHelper.darkLight,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.centerRight,
                colors: [
                  ColorHelper.darkLight,
                  ColorHelper.primary,
                  ColorHelper.primaryLight,
                  ColorHelper.primary,
                  ColorHelper.darkLight,
                ],
                // stops: [0.8, 0.95, 0.99]
                stops: [0.55, 0.60, 0.65, 0.7, 0.99]
              ),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: ColorHelper.primary.withValues(alpha:0.7),
                width: 0.5,             
              ),
              // boxShadow: [
              //   BoxShadow(
              //     color: ColorHelper.primary.withValues(alpha:0.3),
              //     spreadRadius: 1,
              //     blurRadius: 3,
              //     offset: const Offset(0, 0)
              //   ),
              // ],
            ),
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(cryptos[i]['description']),
                const Icon(Icons.arrow_forward_ios, size: 15),
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