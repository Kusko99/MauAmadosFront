import 'package:flutter/material.dart';
import 'package:mauamados/src/pages/pages.dart';

class ChatPage extends StatelessWidget{
  final List<Map<String, dynamic>> conversas;
  final int idUsuarioAtual;
  final double fontSize;

  const ChatPage({required this.conversas, required this.fontSize, required this.idUsuarioAtual, super.key});
  
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ChatContatos(conversas: conversas, idUsuarioAtual: idUsuarioAtual, fontSize: fontSize,),
      ),
    );
  }
}