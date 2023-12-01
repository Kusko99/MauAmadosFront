import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mauamados/src/app.dart';

class TelaDeletar extends StatefulWidget {

  const TelaDeletar({
    super.key,
  });

  @override
  State<TelaDeletar> createState() => _TelaDeletarState();
}

class _TelaDeletarState extends State<TelaDeletar> {
  @override
  void initState() {
    super.initState();
    sair();
  }

  void sair() {
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const App()
        )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height * 0.02;
    double deviceSide = MediaQuery.of(context).size.shortestSide;
    double fontSize = deviceSide * 0.06;
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
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(deviceSide)*0.05,
                child:   Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Você vai nos MAUÁbandonar?',
                      style: TextStyle(color: Colors.white, fontSize: fontSize),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: deviceHeight,
                    ),
                    Text(
                      'Tudo bem, esperamos que tenha MAUÁchado seu MAUÁmor!',
                      style: TextStyle(color: Colors.white, fontSize: fontSize),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: deviceHeight,
                    ),
                    Text(
                      'Mas, se não MAUÁchou, saiba que será sempre MAUÁceito de volta.',
                      style: TextStyle(color: Colors.white, fontSize: fontSize),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )
            ),
          )
        ],
      ),
    );
    
  }
}
