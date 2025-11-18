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
  late Widget currentPage;
  Widget? backPage;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    currentPage = CryptosPage(onPageChange: changePageCallback);
    changePageCallback(CryptosPage(onPageChange: changePageCallback));
  }

  @override
  void dispose() {
    pagesController.dispose();
    super.dispose();
  }

  void changePageCallback(Widget? page) {
    setState(() {
      backPage = currentPage;
      currentPage = page ?? CryptosPage(onPageChange: changePageCallback);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Topbar(
            title: pagesController.title,
            backPage: backPage,
            onPageChange: changePageCallback
          ),
          
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

