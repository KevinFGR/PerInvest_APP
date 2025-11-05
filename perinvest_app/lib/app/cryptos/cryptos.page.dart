import 'package:flutter/material.dart';
import 'package:perinvest_app/app/cryptos/cryptos.controller.dart';

class CryptosPage extends StatefulWidget {
  const CryptosPage({super.key});

  @override
  State<CryptosPage> createState() => CryptosPageState();
}

class CryptosPageState extends State<CryptosPage> {
  final cryptosController = CryptosController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  bool isLoading = true;

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
    return Scaffold(
   extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(27),
        child: ListenableBuilder(
          listenable: cryptosController, 
          builder: (context, child) => 
            cryptosController.getCryptosList()
        ),
      ),
    );
  }
}