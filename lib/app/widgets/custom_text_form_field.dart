import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/app/constants/app_constants.dart';

class CustomTextFormField extends GetView {
  final String labelText;
  final TextInputType typeKeyboard;
  @override
  final TextEditingController controller;
  final String image;
  final Color color;

  const CustomTextFormField(
      {required this.labelText,
      required this.typeKeyboard,
      required this.controller,
      required this.image,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: typeKeyboard,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      textAlign: TextAlign.start,
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
          fontSize: 16.0),
      decoration: InputDecoration(
        suffixIcon: Container(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            image,
            height: 7.0,
            fit: BoxFit.fitHeight,
            color: color,
          ),
        ),
        hintText: labelText,
        filled: true,
        fillColor: Colors.white30,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: color,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
