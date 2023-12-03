import 'package:flutter/material.dart';
import 'package:mauamados/src/pages/pages.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatPage extends StatefulWidget{
  final int idUsuarioAtual;
  final double fontSize;

  const ChatPage({
    required this.fontSize, 
    required this.idUsuarioAtual,
    super.key
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> getConversas(int id) async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/get_todas_conversas/$id'));
    setState(() {
      conversasAPI = json.decode(response.body);
    });
  }
  dynamic conversasAPI;

  @override
  Widget build(BuildContext context) {
    getConversas(widget.idUsuarioAtual);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ChatContatos(
          conversasAPI: conversasAPI['todas_as_conversas'],
          idUsuarioAtual: widget.idUsuarioAtual, 
          fontSize: widget.fontSize,
        ),
      ),
    );
  }
}