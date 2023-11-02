import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget{
  final Color corFonte;
  final Color corFundo;
  final Color corBorda;
  final double deviceHeight;
  final double fontSize;
  final String texto;
  final void Function() onTap;

  const LoginButton({
    required this.corFonte,
    required this.corFundo,
    required this.corBorda,
    required this.deviceHeight,
    required this.fontSize,
    required this.texto,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: corBorda,
          width: deviceHeight * 0.005
        ),
        borderRadius: BorderRadius.circular(90)
      ),
      width: MediaQuery.of(context).size.width * 0.7,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: corFundo
        ),
        onPressed: onTap,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: deviceHeight * 0.01,
            ),
            child: Text(
              texto,
              style: TextStyle(
                fontSize: fontSize * 0.6 < 14 ? 14 : fontSize * 0.6,
                color: corFonte,
                fontWeight: FontWeight.bold
              ),
            ),
          )
        ) 
      )
    );
  }
}