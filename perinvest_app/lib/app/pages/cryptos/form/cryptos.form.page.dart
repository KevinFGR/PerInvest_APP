import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perinvest_app/app/pages/cryptos/form/cryptos.form.controller.dart';
import 'package:perinvest_app/helpers/color.helper.dart';
import 'package:perinvest_app/helpers/widget.helper.dart';

class CryptosFormPage extends StatefulWidget {
  const CryptosFormPage({this.idCrypto, super.key});

  final String? idCrypto; 

  @override
  State<CryptosFormPage> createState() => CryptosFormPageState();
}

class CryptosFormPageState extends State<CryptosFormPage> {
  late final CryptosFormController controller;

  @override
  void initState() {
    super.initState();
    controller = CryptosFormController(idCrypto: widget.idCrypto);
    // await controller.verifyIsEdit();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color:ColorHelper.darkLight.withValues(alpha: 0.4),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...WidgetHelper.formLabel(label: "Descrição"),
                  ...WidgetHelper.formTextField(
                    controller: controller.descriptionController,
                  ),

                  ...WidgetHelper.formLabel(label: "Cor"),
                  ...WidgetHelper.formTextField(
                    controller: controller.colorController,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                colors: [
                  ColorHelper.primaryLight,
                  ColorHelper.primary,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              borderRadius: BorderRadius.circular(30),
              color: Colors.transparent,
              child: Text(
                controller.isLoading ? "carregando..." : "Salvar",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              onPressed: () async => await controller.save(),
            ),
          )
        ],
      )
    );
  }
}