import 'package:flutter/material.dart';

class AppColors{
  // Colors
  static const primaryColor = Color(0xFF0D1333);
  static const secundaryColor = Color(0xFF6E8AFA);
  static const errorColor = Color(0xFFFFD073);
  static const successColor = Color(0xFF49CC96);
  static const textColor = Color(0xFF333333);
}

class AppTextSyles{
  static getTextStyle(Color color){
    return TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static getTextStyleMin(Color color){
    return TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }
}

