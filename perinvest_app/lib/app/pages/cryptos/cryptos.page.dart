import 'package:flutter/material.dart';
import 'package:perinvest_app/app/pages/cryptos/cryptos.controller.dart';
import 'package:perinvest_app/helpers/color.helper.dart';

class CryptosPage extends StatefulWidget {
    const CryptosPage({super.key, required this.onPageChange});
    final Function(Widget) onPageChange;

  @override
  State<CryptosPage> createState() => CryptosPageState();
}

class CryptosPageState extends State<CryptosPage> {
  final controller = CryptosController();

  @override
  void initState() {
    super.initState();
    controller.initCallback(widget.onPageChange);
    controller.getCryptos();
  }

  @override
  void dispose() {
    controller.dispose(); // importante liberar
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color:ColorHelper.darkLight.withValues(alpha: 0.4),
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child:SingleChildScrollView(
            child: ListenableBuilder(
              listenable: controller,
              builder: (context, child) {
                // if (controller.isLoading) {
                //   return const Center(child: CircularProgressIndicator());
                // }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: controller.getCryptosList(context),
                );
              }
            )
          )
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Container(
            decoration: BoxDecoration(
              color: ColorHelper.darkLight,
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  ColorHelper.primary,
                  ColorHelper.primaryLight,
                ]
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              onPressed: () {
                controller.openCryptosForm(null);
              },
              child: Icon(Icons.add),
            ),
          ),
        ),
      ]
    );
  }
}