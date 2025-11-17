import 'package:flutter/material.dart';
import 'package:perinvest_app/helpers/toast.helper.dart';
import 'package:perinvest_app/services/cryptos.service.dart';

class CryptosFormController extends ChangeNotifier{
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController colorController = TextEditingController();

  final String? idCrypto;


  bool isLoading = false;
  bool isEdit = false;

  CryptosFormController({this.idCrypto}) {
    descriptionController.addListener(_onNameChanged);
    colorController.addListener(_onNameChanged);

    verifyIsEdit();
  }

  
  void _onNameChanged() {
    // notifyListeners(); // para ouvir as mudanças na UI
  }

  @override
  void dispose() {
    descriptionController.dispose();
    colorController.dispose();
    super.dispose();
  }

  Future verifyIsEdit() async{
    if(idCrypto == null) {
      isEdit = false;
    } else {
      isEdit = true;
      await getCryptoById();
    }
    notifyListeners();
  }

  Future<void> getCryptoById() async {
    try{
      isLoading = true;
      dynamic response = await CryptosService.getById(idCrypto ?? "");
      descriptionController.text = response["description"];
      colorController.text = response["color"];
    } catch(ex) {
      ToastHelper.error("Falha ao buscar Crypto");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> save() async {
    try {
      if(isLoading) return;
      isLoading = true;
      dynamic body = {
        "description": descriptionController.text,
        "color": colorController.text,
      };
      dynamic res = await CryptosService.insert(body);
      print(res);
      if(!res['success']) {
        ToastHelper.warning(res['message']);
      } else{
        ToastHelper.success(res['message']);
      }
    } catch(ex) {
        ToastHelper.error("Falha ao salvar Crypto");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}