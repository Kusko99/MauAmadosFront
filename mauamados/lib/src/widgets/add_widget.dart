import 'package:flutter/material.dart';

class AddWidget extends StatelessWidget {
  final double iconSize;
  final VoidCallback onPressed;

  const AddWidget({
    required this.iconSize,
    required this.onPressed,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(iconSize * 0.3),
      padding: EdgeInsets.all(iconSize * 0.5),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(90),
      ),
      child: IconButton(
        onPressed: onPressed, 
        icon: Icon(
          Icons.add, 
          size: iconSize,
          color: Colors.white70,
        )
      ),
    );
  }
}