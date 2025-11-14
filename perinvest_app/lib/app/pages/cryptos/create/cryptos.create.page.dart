import 'package:flutter/material.dart';
import 'package:perinvest_app/app/pages/cryptos/create/cryptos.create.controller.dart';

class CryptosCreatePage extends StatefulWidget {
  const CryptosCreatePage({super.key});

  @override
  State<CryptosCreatePage> createState() => CryptosCreatePageState();
}

class CryptosCreatePageState extends State<CryptosCreatePage> {
  final cryptosCreateController = CryptosCreateController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    cryptosCreateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.grey.shade900.withValues(alpha: 0.4),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child:SingleChildScrollView(
        child: GestureDetector(
          onTap: () => CryptosCreateController.backToPage(context),
          child: Text("Voltar"),
        )
      )
    );
  }
}