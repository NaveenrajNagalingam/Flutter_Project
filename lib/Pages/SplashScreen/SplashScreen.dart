import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget{
  const SplashScreen({super.key, required extraData});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'My Notes',
          style: TextStyle(
            fontFamily: 'NunitoRegular',
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Color(0xFF9A9A9A)
          ),
        ),
      ),
    );
  }

}