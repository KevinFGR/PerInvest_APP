import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastHelper{
  static void success(String? message){
    Fluttertoast.showToast(
      msg: message ?? "",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green[600],
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void warning(String? message){
    Fluttertoast.showToast(
      msg: message ?? "",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.orange[600],
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void error(String? message){
    Fluttertoast.showToast(
      msg: message ?? "",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red[600],
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}