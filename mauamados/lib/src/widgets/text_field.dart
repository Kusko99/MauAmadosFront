import 'package:flutter/material.dart';
import 'package:mauamados/src/widgets/profile_box.dart';

class TextFieldWidget extends StatefulWidget{
  final String label;
  final String text;
  final ValueChanged<String> onChanged;
  final double fontSize;

  const TextFieldWidget({required this.label, required this.text, required this.onChanged, required this.fontSize, super.key});

  @override
  State<TextFieldWidget> createState(){
    return _TextFieldWidgetState();
  }
}

class _TextFieldWidgetState extends State<TextFieldWidget>{
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return ProfileBox(
      label: widget.label, 
      fontSize: widget.fontSize,
      data: TextField(
        controller: controller,
        style: TextStyle(fontSize: widget.fontSize),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color.fromARGB(255, 158, 189, 255)), // Cor da borda quando em foco
          ),
        ),
        maxLines: null,
        onChanged: widget.onChanged,
      ),
    );
  }
}