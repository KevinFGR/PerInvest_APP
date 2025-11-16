import 'package:flutter/material.dart';
import 'package:perinvest_app/app/pages.dart';

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
}