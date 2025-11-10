import 'package:flutter/material.dart';
import 'package:perinvest_app/app/cryptos/cryptos.controller.dart';

class CryptosPage extends StatefulWidget {
  const CryptosPage({super.key});

  @override
  State<CryptosPage> createState() => CryptosPageState();
}

class CryptosPageState extends State<CryptosPage> {
  final cryptosController = CryptosController();

  @override
  void initState() {
    super.initState();
    cryptosController.getCryptos();
  }

  @override
  void dispose() {
    cryptosController.dispose(); // importante liberar
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(27),
      child:ListenableBuilder(
        listenable: cryptosController,
        builder: (context, child) {
          // se quiser mostrar loading:
          // if (cryptosController.isLoading) {
          //   return const Center(child: CircularProgressIndicator());
          // } 
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: cryptosController.getCryptosList()
          );
        }
      )
    );
  }
}