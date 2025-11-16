import 'package:flutter/material.dart';
import 'package:perinvest_app/app/pages/cryptos/cryptos.page.dart';
import 'package:perinvest_app/app/pages.controller.dart';
import 'package:perinvest_app/app/topbar/topbar.page.dart';
import 'package:perinvest_app/helpers/color.helper.dart';

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => PagesState();
}

class PagesState extends State<Pages> {
  final pagesController = PagesController();
  // final cryptosPage = const CryptosPage();

  // Widget currentPage = CryptosPage(onChangePage: changePageCallback);
  late Widget currentPage;

  bool isLoading = true;

  void changePageCallback(Widget? page) {
    setState(() {
      currentPage = page ?? CryptosPage(onChangePage: changePageCallback);
    });
  }

  @override
  void initState() {
    super.initState();
    changePageCallback(null);
  }

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
          
          Expanded(child: currentPage),

          Container(
            height:100,
            width: double.infinity,
            color: ColorHelper.darkLight,
            padding: const EdgeInsets.all(12),
            child: const Text('Bottom bar (fixa)'),
          ),
        ],
      )
    );
  }
}

