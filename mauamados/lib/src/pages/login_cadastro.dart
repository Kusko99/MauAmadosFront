import 'package:flutter/material.dart';

class LoginCadastro extends StatelessWidget {
  const LoginCadastro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Image.network(
              'https://i.imgur.com/hbl9YoF.png',
              width: MediaQuery.of(context).size.shortestSide,
              height: MediaQuery.of(context).size.shortestSide,
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
                  child: const Text(
                    'MAUÁ',
                    style: TextStyle(
                      color: Color.fromARGB(255,1,75,173),
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 20
                  ),
                  child: const Text(
                    'mados',
                    style: TextStyle(
                      color: Color.fromARGB(255,1,75,173),
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                    ),
                  ),
                )
              ],
            )
          ],
        )
      )
    );
  }
}