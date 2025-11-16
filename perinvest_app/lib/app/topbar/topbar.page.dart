import 'package:flutter/material.dart';
import 'package:perinvest_app/app/topbar/topbar.controller.dart';
import 'package:perinvest_app/helpers/color.helper.dart';

class Topbar extends StatefulWidget {
  const Topbar({super.key, required this.title});
  final String title;

  @override
  State<Topbar> createState() => TopbarState();
}

class TopbarState extends State<Topbar> {
  final topbarController = TopbarController();

  @override
  void dispose() {
    topbarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: ColorHelper.darkLight,
      width: double.infinity,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children:[
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => TopbarController.logout(context),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = LinearGradient(
                    colors: [
                      ColorHelper.primary,
                      ColorHelper.primary,
                      ColorHelper.primary,
                      ColorHelper.primaryLight,
                      ColorHelper.primary,
                      ColorHelper.primary,
                      ColorHelper.primary,
                    ],
                  ).createShader(const Rect.fromLTWH(0, 200, 450, 50))
                ),
              ),
            ),
          ),
          Opacity(
            opacity: 0,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {},
            ),
          )
        ]
      )
    );
  }
}