import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/pages/pages.dart';

class ProfilePage extends StatelessWidget {
  final double fontSize1;
  final double fontSize2;
  final User usuarioAtual;
  const ProfilePage({
    required this.fontSize1, 
    required this.fontSize2,
    required this.usuarioAtual, 
    super.key});

@override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ProfileMainPage(user: usuarioAtual, fontSize1: fontSize1, fontSize2: fontSize2,),
      ),
    );
  }
}