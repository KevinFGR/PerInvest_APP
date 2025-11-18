import 'package:flutter/material.dart';


class TopbarController extends ChangeNotifier{

  bool isLoading = true;
  Function(Widget)? pageCallback;

  void initCallback(Function(Widget) func) {
    pageCallback = func;
  }

  void backPage(Widget? backPage){
    if(backPage != null) {
      pageCallback?.call(backPage);
    }
  }
  
  
  // static void logout(BuildContext context) {
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (context) => const LoginPage()),
  //   );
  // }
}