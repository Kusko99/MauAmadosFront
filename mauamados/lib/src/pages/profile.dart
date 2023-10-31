import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/pages/pages.dart';

class ProfilePage extends StatelessWidget {
  final double fontSize1;
  final double fontSize2;
  final int idUsuarioAtual;
  const ProfilePage({
    required this.fontSize1, 
    required this.fontSize2,
    required this.idUsuarioAtual, 
    super.key});

@override
  Widget build(BuildContext context) {
    User? user = User.getUserById(idUsuarioAtual);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ProfileMainPage(user: user, fontSize1: fontSize1, fontSize2: fontSize2, idUsuarioAtual: idUsuarioAtual,),
      ),
    );
  }
}