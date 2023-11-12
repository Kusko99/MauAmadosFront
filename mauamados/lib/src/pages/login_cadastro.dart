import 'dart:ui';
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double altura = deviceHeight;
    double deviceWidth = MediaQuery.of(context).size.width;

    if (deviceHeight * 0.8 < deviceWidth) {
      altura = deviceHeight * 0.5;
    }

    double fontSize = MediaQuery.of(context).size.shortestSide * 0.04;
    double imageSize = (fontSize * 12);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://i.imgur.com/9YiQLOt.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black.withOpacity(0.9), Colors.black.withOpacity(0.3)],
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: altura * 0.06),
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
                        margin: EdgeInsets.symmetric(vertical: altura * 0.02),
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              width: fontSize,
                              color: const Color.fromARGB(255, 1, 75, 173),
                            ),
                          ),
                        ),
                        child: DefaultTextStyle(
                          style: TextStyle(
                            color: const Color.fromARGB(255, 1, 75, 173),
                            fontWeight: FontWeight.bold,
                            fontSize: fontSize * 2,
                          ),
                          child: const Text('MAUÁ'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: fontSize),
                        child: DefaultTextStyle(
                          style: TextStyle(
                            color: const Color.fromARGB(255, 1, 75, 173),
                            fontWeight: FontWeight.bold,
                            fontSize: fontSize * 2,
                          ),
                          child: const Text('mados'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: deviceHeight * 0.1,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: deviceHeight*0.1
                    ),
                    child: Column(
                      children: [
                        LoginButton(
                          corFundo: const Color.fromARGB(255, 1, 75, 173),
                          corBorda: const Color.fromARGB(255, 1, 75, 173),
                          corFonte: Colors.white,
                          deviceHeight: deviceHeight,
                          fontSize: fontSize,
                          texto: 'Entrar',
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => LoginPage(
                                  fontSize1: fontSize1,
                                  fontSize2: fontSize2,
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: altura * 0.02,
                        ),
                        LoginButton(
                          corBorda: Colors.white,
                          corFundo: Colors.transparent,
                          corFonte: Colors.white,
                          deviceHeight: deviceHeight,
                          fontSize: fontSize,
                          texto: 'Novo Usuário',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      'O MAUÁplicativo para MAUÁlunos MAUÁcharem seus MAUÁmores',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: fontSize * 0.8 > 14 ? 14 : fontSize * 0.8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
