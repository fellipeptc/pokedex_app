import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/app/constants/app_constants.dart';

class CustomButton extends GetView {
  final String _text;
  final _function;

  const CustomButton(this._text, this._function);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: _function,
        child: Text(_text),
        style: ElevatedButton.styleFrom(
          primary: AppColors.primaryColor,
          padding: const EdgeInsets.all(20.0),
          elevation: 5.0,
          textStyle: const TextStyle(fontSize: 18.0),
        ));
  }
}
