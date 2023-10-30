import 'package:flutter/material.dart';

class LoginCadastro extends StatelessWidget {
  const LoginCadastro({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.shortestSide * 0.04;
    double imageSize = (fontSize/4)*49.5;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: imageSize / 10
              ),
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
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        width: 20,
                        color: Color.fromARGB(255,1,75,173),
                      ),
                    ),
                  ),
                  child: Text(
                    'MAUÁ',
                    style: TextStyle(
                      color: const Color.fromARGB(255,1,75,173),
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize * 2,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 20
                  ),
                  child: Text(
                    'mados',
                    style: TextStyle(
                      color: const Color.fromARGB(255,1,75,173),
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize * 2,
                    ),
                  ),
                )
              ],
            ),
            
          ],
        ),
      )
    );
  }
}