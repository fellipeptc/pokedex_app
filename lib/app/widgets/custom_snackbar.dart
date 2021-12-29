import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static getSnackBar(
      String title, String message, IconData icon, MaterialAccentColor color) {
    return Get.snackbar(
      title,
      message,
      margin: const EdgeInsets.all(20.0),
      snackPosition: SnackPosition.BOTTOM,
      icon: Icon(icon, color: Colors.white,),
      backgroundColor: color,
      colorText: Colors.white,
      duration: const Duration(seconds: 3)
    );
  }
}
