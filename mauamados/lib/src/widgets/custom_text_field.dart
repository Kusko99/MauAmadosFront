import 'package:flutter/material.dart';
import 'package:mauamados/src/widgets/profile_box.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final double fontSize;
  final String hintText;
  final String label;

  const CustomTextField({
    required this.controller,
    required this.fontSize,
    required this.hintText,
    required this.label,
    super.key
  });

  @override
  Widget build(BuildContext context){
    return ProfileBox(
      data: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: fontSize
        ),
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 0, 71, 133)),
          ),
        ),
      ), 
      label: label, 
      fontSize: fontSize
    );
  }
}