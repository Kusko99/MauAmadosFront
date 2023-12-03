import 'package:flutter/material.dart';

class BotaoDoMau extends StatelessWidget {
  final double fontSize;
  final Color color;
  final String texto;
  final VoidCallback onPressed;
  const BotaoDoMau({
    super.key, 
    required this.onPressed,
    required this.fontSize, 
    required this.color,
    required this.texto
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.058,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.all(0)
          ),
          onPressed: onPressed,
          child: Container(
            padding: EdgeInsets.all(fontSize * 0.4),
            decoration: BoxDecoration(
              border: Border.all(
                color: color,
              ),
              borderRadius: BorderRadius.circular(5)
            ),
            child:Text(
              texto, 
              style: TextStyle(
                fontSize: fontSize,
                color: color
              ),
            )
          ),
        ),
      ),
    );
  }
}