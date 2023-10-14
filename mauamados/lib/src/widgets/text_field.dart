import 'package:flutter/material.dart';

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
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.06,
        vertical: MediaQuery.of(context).size.height * 0.02
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: widget.fontSize
            ),
          ),
          TextField(
            controller: controller,
            style: TextStyle(fontSize: widget.fontSize),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)
              ),
            ),
            maxLines: null,
            onChanged: widget.onChanged,
          ),
        ],
      ),
    );
  }
}