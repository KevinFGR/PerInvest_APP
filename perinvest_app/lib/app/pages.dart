import 'package:flutter/material.dart';
import 'package:perinvest_app/app/cryptos/cryptos.controller.dart';
import 'package:perinvest_app/app/cryptos/cryptos.page.dart';
import 'package:perinvest_app/app/pages.controller.dart';

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => PagesState();
}

class PagesState extends State<Pages> {
  final pagesController = PagesController();
  // final cryptosController = CryptosController();
  final cryptosPage = const CryptosPage();

  bool isLoading = true;

  @override
  void dispose() {
    pagesController.dispose();
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
      body: SingleChildScrollView(
        // width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text(pagesController.Title),
            // ListenableBuilder(
            //   listenable: cryptosController, 
            //   builder: (context, child) => cryptosPage
            // )
            cryptosPage
          ],
        )
      ),
    );
  }
}

