import 'package:flutter/material.dart';
import 'package:mauamados/src/pages/pages.dart';

class ChatPage extends StatefulWidget{
  final List<Map<String, dynamic>> conversas;
  final int idUsuarioAtual;
  final double fontSize;

  const ChatPage({required this.conversas, required this.fontSize, required this.idUsuarioAtual, super.key});

  @override
  State<ChatPage> createState() {
    return _ChatPageState();
  }
}

class _ChatPageState extends State<ChatPage>{
  
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ChatConversa(conversas: widget.conversas, fontSize: widget.fontSize, idUsuarioAtual: widget.idUsuarioAtual),
      ),
    );
  }
}