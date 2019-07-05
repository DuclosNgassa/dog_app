import 'package:flutter/material.dart';

class CustomLinearGradient extends StatelessWidget {
  final Widget myChild;

  CustomLinearGradient({this.myChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.indigo[800],
            Colors.lightBlueAccent[700],
            Colors.deepPurple[600],
            Colors.indigo[400],
          ],
        ),
      ),
      child: myChild,
    );
  }
}
