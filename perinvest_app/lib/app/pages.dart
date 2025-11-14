import 'package:flutter/material.dart';
import 'package:perinvest_app/app/pages/cryptos/cryptos.page.dart';
import 'package:perinvest_app/app/pages.controller.dart';
import 'package:perinvest_app/app/topbar/topbar.page.dart';

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => PagesState();
}

class PagesState extends State<Pages> {
  final pagesController = PagesController();
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Topbar(title: pagesController.title),
          // Container(
          //   decoration: BoxDecoration(color: Colors.amber.shade900),
          //   child: 
          // ),
          Expanded(child: cryptosPage),
          
          Container(
            height:100,
            width: double.infinity,
            color: Colors.grey[900],
            padding: const EdgeInsets.all(12),
            child: const Text('Bottom bar (fixa)'),
          ),
        ],
      )
    );
  }
}

