import 'package:flutter/material.dart';

class Indicator extends StatelessWidget{
  final bool isActive;
  const Indicator({required this.isActive, super.key});

  @override
  Widget build(BuildContext context){
    return 
      Expanded(
        child: Container(
          height: 4,
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: isActive? Colors.grey[800] : Colors.grey[350]
          ),
        )
      );
  }
} 