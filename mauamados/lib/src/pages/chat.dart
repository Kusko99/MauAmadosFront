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
    getConversas(widget.idUsuarioAtual);
  }

  Future<dynamic> getConversas(int id) async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/get_todas_conversas/$id'));
    final utf8Body = utf8.decode(response.bodyBytes);
    dynamic conversasAPI = json.decode(utf8Body);
    return conversasAPI;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder(
          future: getConversas(widget.idUsuarioAtual), 
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text('Erro ao carregar usuário');
            } else if (!snapshot.hasData) {
              return const Text('Dados do usuário não encontrados');
            } else {
              final conversasAPI = snapshot.data!;
              return ChatContatos(
                conversasAPI: conversasAPI['todas_as_conversas'],
                idUsuarioAtual: widget.idUsuarioAtual, 
                fontSize: widget.fontSize,
              );
            }
          }
        )
      ),
    );
  }
}