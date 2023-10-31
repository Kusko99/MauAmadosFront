import 'package:flutter/material.dart';
import 'package:mauamados/src/pages/pages.dart';
import 'package:mauamados/src/widgets/widgets.dart';

class LoginCadastro extends StatelessWidget {
  final double deviceHeight;
  final double fontSize1;
  final double fontSize2;

  const LoginCadastro({
    required this.fontSize1,
    required this.fontSize2,
    required this.deviceHeight,
    super.key
  });


  @override
  Widget build(BuildContext context) {

    int idUsuarioAtual = 1;

    double fontSize = MediaQuery.of(context).size.shortestSide * 0.04;
    double imageSize = (fontSize/4)*48;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          children: [
            SizedBox(
              width: imageSize,
              height: imageSize,
              child: const Image(
                image: NetworkImage(
                  'https://i.imgur.com/mgKFZtj.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: deviceHeight * 0.02
                  ),
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        width: fontSize,
                        color: const Color.fromARGB(255,1,75,173),
                      ),
                    ),
                  ),
                  child: DefaultTextStyle(
                    style: TextStyle(
                      color: const Color.fromARGB(255,1,75,173),
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize * 2,
                    ),
                    child: const Text('MAUÁ',),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: fontSize
                  ),
                  child: DefaultTextStyle(
                    style: TextStyle(
                      color: const Color.fromARGB(255,1,75,173),
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize * 2,
                    ),
                    child: const Text('mados'),
                  ),
                )
              ],
            ),
          ],
        ),
        Column(
          children: [
            LoginButton(
              cor1: const Color.fromARGB(255,1,75,173),
              cor2: Colors.white,
              deviceHeight: deviceHeight,
              fontSize: fontSize,
              texto: 'Entrar',
              login: true,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => 
                    MainScreen(
                      fontSize1: fontSize1,
                      fontSize2: fontSize2,
                      idUsuarioAtual: idUsuarioAtual
                    ),
                  ),
                );
              },
            ),
            LoginButton(
              cor1: Colors.white, 
              cor2: const Color.fromARGB(255,1,75,173), 
              deviceHeight: deviceHeight, 
              fontSize: fontSize, 
              texto: 'Novo Usuário',
              login: false,
              onTap: () {},
            )
          ],
        )
      ],
    );
  }
}