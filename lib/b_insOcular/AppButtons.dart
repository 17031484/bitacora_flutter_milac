import 'package:flutter/material.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  String? text;
  double w_size= 100;
  double h_size=60;
  final Color borderColor;

  AppButtons(
      {super.key,
      this.text,
      required this.color,
      required this.backgroundColor,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: w_size,
      height: h_size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,width: 1.0
        ),
          borderRadius: BorderRadius.circular(20),
          color: backgroundColor), child: Center(child: Text(text!, style: TextStyle(color: color),))
    );
  }
}
