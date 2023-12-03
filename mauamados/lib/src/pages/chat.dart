import 'package:flutter/material.dart';
import 'package:mauamados/src/pages/pages.dart';

class ChatPage extends StatelessWidget{
  final int idUsuarioAtual;
  final double fontSize;
  final List<dynamic> conversasAPI;

  const ChatPage({
    required this.fontSize, 
    required this.idUsuarioAtual,
    required this.conversasAPI,
    super.key
  });
  
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ChatContatos(
          conversasAPI: conversasAPI,
          idUsuarioAtual: idUsuarioAtual, 
          fontSize: fontSize,
        ),
      ),
    );
  }
}