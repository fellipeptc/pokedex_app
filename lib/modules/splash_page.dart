import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key) {
    startTimeout();
  }

  startTimeout() async {
    return Timer(const Duration(seconds: 10), changeScreen);
  }

  changeScreen() async {
    Get.offAllNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }

  Container _buildBody() {
    return Container(
      decoration: _buildBakcGradient(),
      margin: const EdgeInsets.only(left: 4.0, right: 4.0),
      child: _buildImageAndText(),
    );
  }

  Center _buildImageAndText() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(width: 2.0),
          Container(
            alignment: Alignment.center,
            width: 50,
            child: Image.asset(
              "assets/images/pokedex.png",
              fit: BoxFit.cover,
              height: 250.0,
              width: 250.0,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Lottie.asset('assets/animations/pokeload.json',
                    width: 120.0, height: 120.0, fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Text(
                    'FELLIPE AUGUSTO PRATES',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration _buildBakcGradient() {
    return BoxDecoration(
      gradient: LinearGradient(
          begin: const FractionalOffset(0.5, 0.0),
          end: const FractionalOffset(0.0, 0.5),
          stops: const [0.0, 1.0],
          tileMode: TileMode.clamp,
          colors: [Colors.white54, Colors.lightBlue.shade100]),
    );
  }
}
