import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final Color color;
  DashboardScreen(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}