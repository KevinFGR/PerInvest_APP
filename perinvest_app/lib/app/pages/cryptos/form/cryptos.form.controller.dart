import 'package:flutter/material.dart';
import 'package:perinvest_app/app/pages/cryptos/cryptos.page.dart';
import 'package:perinvest_app/helpers/toast.helper.dart';
import 'package:perinvest_app/services/cryptos.service.dart';

class CryptosFormController extends ChangeNotifier{
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  Function(Widget)? pageCallback;

  final String? idCrypto;
  bool isLoading = false;
  bool isEdit = false;

  void initCallback(Function(Widget) func) {
    pageCallback = func;
  }

  CryptosFormController(this.idCrypto) {
    descriptionController.addListener(_onNameChanged);
    colorController.addListener(_onNameChanged);
    Future.microtask(() async => await verifyIsEdit());
  }
  
  void _onNameChanged() { /* notifyListeners();  para ouvir as mudanças na UI*/ }

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
      if(response["success"]){
        descriptionController.text = response["data"]["description"];
        colorController.text = response["data"]["color"];
      } else {
        ToastHelper.error(response["message"]);
      }
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
        "id": idCrypto ?? "",
        "description": descriptionController.text,
        "color": colorController.text,
      };
      dynamic res = isEdit
        ? await CryptosService.update(body) 
        : await CryptosService.insert(body);
        
      if(res['success']) {
        ToastHelper.success(res['message']);
        pageCallback?.call(CryptosPage(onPageChange: pageCallback!,));
      } else{
        ToastHelper.warning(res['message']);
      }
    } catch(ex) {
        ToastHelper.error("Falha ao salvar Crypto");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}