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
  final controller = PagesController();
  late Widget currentPage;
  late List<Widget> pagesHistory;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    currentPage = CryptosPage(onPageChange: changePageCallback);
    pagesHistory = [];
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void changePageCallback(Widget page) {
    setState(() {
      int index = pagesHistory.indexWhere((x) => x.runtimeType == page.runtimeType);
      if (index != -1) {
        pagesHistory.removeRange(index, pagesHistory.length);
        // pagesHistory.removeAt(index);
      } else {
        pagesHistory.add(currentPage);
      }
      currentPage = page;
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
            title: controller.title,
            pagesHistory: pagesHistory,
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

