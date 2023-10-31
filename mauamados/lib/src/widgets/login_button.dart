import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget{
  final Color cor1;
  final Color cor2;
  final double deviceHeight;
  final double fontSize;
  final String texto;
  final bool login;
  final void Function() onTap;

  const LoginButton({
    required this.cor1,
    required this.cor2,
    required this.deviceHeight,
    required this.fontSize,
    required this.texto,
    required this.login,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: cor1,
          width: deviceHeight * 0.005
        ),
        borderRadius: BorderRadius.circular(90)
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: cor2,
            width: deviceHeight * 0.005
          ),
          borderRadius: BorderRadius.circular(90)
        ),
        width: login == false ? MediaQuery.of(context).size.width * 0.605 : MediaQuery.of(context).size.width * 0.6,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: cor1
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
                  color: cor2,
                  fontWeight: FontWeight.bold
                ),
              ),
            )
          ) 
        )
      ),
    );
  }
}