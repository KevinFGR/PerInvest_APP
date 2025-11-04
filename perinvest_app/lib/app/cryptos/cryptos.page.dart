import 'package:flutter/material.dart';
import 'package:perinvest_app/app/cryptos/cryptos.controller.dart';
import 'package:perinvest_app/helpers/toast.helper.dart';

class CryptosPage extends StatefulWidget {
  const CryptosPage({super.key});

  @override
  State<CryptosPage> createState() => CryptosPageState();
}

class CryptosPageState extends State<CryptosPage> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  dynamic response;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCryptos();
  }

  Future<void> _loadCryptos() async {
    try {
      final res = await CryptosController.getCriptos();
      if (!mounted) return;

      setState(() {
        response = res;
        isLoading = false;
      });
    } catch (ex) {
      if (mounted) {
        setState(() => isLoading = false);
        ToastHelper.warning("Erro ao carregar criptos");
      }
    }
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
        child:  ListView(
          children: [
            if(response == null) ...[
              Row( children: [ Text("response is null") ], )
            ] else ...[
              Row( children: [ Text("")],)
            ]
          ],
        ),
      ),
    );
  }
}