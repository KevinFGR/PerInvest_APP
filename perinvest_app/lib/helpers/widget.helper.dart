import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
}