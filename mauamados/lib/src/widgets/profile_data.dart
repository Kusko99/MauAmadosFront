import 'package:flutter/material.dart';

class ProfileData extends StatelessWidget{
  final String titulo;
  final String data;

  const ProfileData({required this.titulo, required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    double fontSize1 = deviceHeight * 0.04;
    double fontSize2 = deviceHeight * 0.03;
    if (deviceHeight < deviceWidth) {
      deviceWidth = deviceHeight;
    }
    if ((deviceHeight > deviceWidth) && (deviceHeight * 0.047 > deviceWidth * 0.072)){
      fontSize1 = deviceWidth * 0.072;
      fontSize2 = deviceWidth * 0.054;
    }
    if (fontSize1 < 15) {
      fontSize1 = 15;
    }
    if (fontSize2 < 7) {
      fontSize2 = 11;
    }

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