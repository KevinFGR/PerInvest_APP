import 'package:flutter/material.dart';
import 'package:perinvest_app/app/pages.dart';
import 'package:perinvest_app/helpers/toast.helper.dart';
import 'package:perinvest_app/services/cryptos.service.dart';

class CryptosFormController extends ChangeNotifier{
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController colorController = TextEditingController();

  bool isLoading = true;

  CryptosFormController() {
    descriptionController.addListener(_onNameChanged);
    colorController.addListener(_onNameChanged);
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


  static void backToPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Pages()),
    );
  }

  Future<void> save() async {
    if(isLoading) return;

    isLoading = true;
    CryptosService cryptosService =  CryptosService();
    dynamic body = {
      "description": descriptionController.text,
      "color": colorController.text,
    };
    dynamic res = await cryptosService.insert(body);
    print(res);
    if(!res['success']) {
      ToastHelper.warning(res['message']);
    } else{
      ToastHelper.success(res['message']);
    }
    isLoading = false;
    notifyListeners();
  }
}