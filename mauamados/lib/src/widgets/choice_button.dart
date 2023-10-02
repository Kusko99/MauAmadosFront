import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget{
  final double size;
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  const ChoiceButton({ Key? key,
    required this.size,
    required this.color,
    required this.icon,
    required this.onPressed
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      height: size * 2,
      width: size * 2,
      margin: EdgeInsetsDirectional.only(
        top: deviceHeight * 0.02,
        bottom: deviceHeight * 0.02
      ),
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.white,
        elevation: 4,
        highlightElevation: 1,
        hoverElevation: 1,
        hoverColor: Colors.grey.withAlpha(50),
        child: Icon(icon, color: color, size: size),
      ),
    );
  }
}