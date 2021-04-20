import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
  //final Color color;
  ServicesScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RichText(
          text: TextSpan(
            text: 'Services Coming Soon',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)
          ),
        ),
       

    ));
  }
}