import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget{
  final double size;
  final Color color;
  final IconData icon;

  const ChoiceButton({ Key? key,
    required this.size,
    required this.color,
    required this.icon,
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
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(50),
            spreadRadius: 4,
            blurRadius: 4,
            offset: const Offset(3, 3)
          )
        ]
      ),
      child: Icon(icon, color: color, size: size)
    );
  }
}