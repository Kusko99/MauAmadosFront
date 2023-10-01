import 'package:flutter/material.dart';

class Interests extends StatelessWidget{
  final String interesse;
  final double fontSize;

  const Interests({required this.interesse, required this.fontSize, super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.all(fontSize * 0.3),
      padding: EdgeInsets.all(fontSize * 0.5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 0, 71, 133),
        borderRadius: BorderRadius.circular(30)
      ),
      child: Text(
        interesse,
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.white
        ),
      ),
    );
  }
}