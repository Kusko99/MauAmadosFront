import 'package:flutter/material.dart';

class ProfileData extends StatelessWidget{
  final String titulo;
  final String data;
  final double fontSize1;
  final double fontSize2;

  const ProfileData({required this.titulo, required this.data, required this.fontSize1, required this.fontSize2, super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: TextStyle(
              fontSize: fontSize1,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            data,
            style: TextStyle(
              fontSize: fontSize2
            ),
          )
        ],
      ),
    );
  }
}