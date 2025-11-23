import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perinvest_app/helpers/color.helper.dart';

class WidgetHelper{
  static List<Widget> formTextField({
      TextInputType? textInputType,
      String? placeholder,
      TextEditingController? controller,
      double? marginButton
    }){
    return[ 
      CupertinoTextField(
        padding: const EdgeInsets.symmetric(
          vertical:18,
          horizontal:16
        ),
        controller: controller,
        keyboardType: textInputType ?? TextInputType.text,
        placeholder: placeholder ?? "DIGITE...",
        placeholderStyle: const TextStyle(
          color:Colors.white70, 
          fontSize:14
        ),
        style: const TextStyle(
          color: Colors.white, 
          fontSize: 14
        ),
        decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        ),
      ),
      SizedBox(height: marginButton ?? 5)
    ];
  }

  static List<Widget> formLabel({
    String? label, 
    double? marginButton
  }){
    return [
      Align(
        alignment: Alignment.centerLeft,
        child: 
        Text(
          label ?? "",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(height: marginButton ?? 5)
    ];
  }

  static Widget floatButton({Function()? function, Icon? icon}){
    return Container(
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
              onPressed: function,
              child: icon ?? Icon(Icons.add),
            ),
          );
  }

  static Future confirm(BuildContext context, Function function){
    return showDialog(
      context: context,
      builder:(BuildContext context) {
        return AlertDialog(
          title:Text("Deseja realmente excluir este item?"),
          content: Text("Não sera mais possível recuperar este item após exclusão"),
          actions: [
            TextButton(
              onPressed: () => {
                Navigator.of(context).pop(false),
                function()
              }, 
              child: Text("Confirmar", style: TextStyle(color: ColorHelper.primary),)
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(false), 
              child: Text("Cancelar")
            ),
          ],
        );
      }
    );
  }
}