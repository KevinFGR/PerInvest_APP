import 'package:flutter/material.dart';
import 'package:perinvest_app/app/pages/cryptos/cryptos.controller.dart';

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
      color:Colors.grey.shade900.withValues(alpha: 0.4),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child:SingleChildScrollView(
        child: ListenableBuilder(
          listenable: cryptosController,
          builder: (context, child) {
            // if (cryptosController.isLoading) {
            //   return const Center(child: CircularProgressIndicator());
            // } 
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: cryptosController.getCryptosList(context),
            );
          }
        )
      )
    );
  }
}