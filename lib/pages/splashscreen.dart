import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Center(
          child: Text(
            "Splash Screen",
            style: TextStyle(color: Colors.amber),
          ),
        ),
      ),
    );
  }
}
