import 'package:flutter/material.dart';

class ProfileBox extends StatelessWidget{
  final Widget data;
  final String label;
  final double fontSize;

  const ProfileBox({required this.data, required this.label, required this.fontSize, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.06,
        vertical: MediaQuery.of(context).size.height * 0.02
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: fontSize,
              color: const Color.fromARGB(255, 0, 71, 133)
            ),
          ),
          data
        ]
      )
    );
  }
}