import 'package:flutter/material.dart';
import 'package:perinvest_app/app/pages/cryptos/form/cryptos.form.page.dart';
import 'package:perinvest_app/helpers/color.helper.dart';
import 'package:perinvest_app/helpers/toast.helper.dart';
import 'package:perinvest_app/services/cryptos.service.dart';


class CryptosController extends ChangeNotifier{

  List<dynamic> cryptos = [];
  bool isLoading = true;

  Function(Widget)? pageCallback;

  void initCallback(Function(Widget) func) {
    pageCallback = func;
  }

  Future<void> getCryptos() async {
    isLoading = true;
    dynamic res = await CryptosService.get();
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
          // onTap: () => openCryptosForm(cryptos[i]["id"]),
          onTap: () {
            showModalBottomSheet(
              context: context, 

              builder: (BuildContext context){
                final size = MediaQuery.of(context).size;
                return Container(
                  height:size.height * 0.4, 
                  width: size.width,
                  child:Text("TESTE")
                );
              }
            );
          },
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
                stops: [0.55, 0.60, 0.65, 0.7, 0.99]
              ),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: ColorHelper.primary.withValues(alpha:0.7),
                width: 0.5,             
              ),
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

  void openCryptosForm(String? id){
    if(id != null){
      pageCallback?.call(CryptosFormPage(idCrypto: id, onPageChange: pageCallback!));
    }else{
      pageCallback?.call(CryptosFormPage(onPageChange: pageCallback!));
    }
  }
}