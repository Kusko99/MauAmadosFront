import 'package:flutter/material.dart';

class NoUsers extends StatelessWidget {
  const NoUsers({super.key});

  @override
  Widget build (BuildContext context){
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sem usuários disponíveis para o seu perfil.',
            textAlign: TextAlign.center,
          ),
          Text(
            'Tente novamente mais tarde.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}