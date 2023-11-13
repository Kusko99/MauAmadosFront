import 'package:flutter/material.dart';
import 'package:mauamados/src/widgets/widgets.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final double fontSize;
  final String hintText;
  final String label;
  final ValueChanged<String> onChanged;
  final String? errorText;
  final bool obscureText;
  final int? maxLines;
  final int minLines;

  const CustomTextField({
    required this.controller,
    required this.fontSize,
    required this.hintText,
    required this.label,
    required this.onChanged,
    this.maxLines = 1,
    this.minLines = 1,
    this.obscureText = false,
    this.errorText,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ProfileBox(
      data: Column(
        children: [
          TextField(
            maxLines: maxLines,
            minLines: minLines,
            controller: controller,
            obscureText: obscureText,
            style: TextStyle(
              fontSize: fontSize,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              errorText: errorText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color.fromARGB(255, 0, 71, 133)),
              ),
            ),
            onChanged: onChanged,
          ),
        ],
      ),
      label: label,
      fontSize: fontSize,
    );
  }
}