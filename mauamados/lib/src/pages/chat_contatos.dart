import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/pages/chat_conversa.dart'; // Importe a tela de conversa

class ChatContatos extends StatelessWidget {
  final int idUsuarioAtual;
  final double fontSize;
  final List<Map<String, dynamic>> conversas;

  const ChatContatos({
    required this.idUsuarioAtual,
    required this.fontSize,
    required this.conversas,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final conversasDoUsuario = List<Map<String, dynamic>>.from(conversas)
      .where((conversa) =>
        conversa['ids'].contains(idUsuarioAtual) &&
        conversa['mensagens'].isNotEmpty)
      .toList();

    return Scaffold(
      body: ListView.builder(
        itemCount: conversasDoUsuario.length,
        itemBuilder: (context, index) {
          final conversa = conversasDoUsuario[index];
          final idOutroUsuario = conversa['ids'].firstWhere(
            (id) => id != idUsuarioAtual,
            orElse: () => -1);
          final outroUsuario = User.users.firstWhere(
            (user) => user.id == idOutroUsuario
          );
          return ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChatConversa(
                    conversa: conversa,
                    fontSize: fontSize,
                    idUsuarioAtual: idUsuarioAtual,
                    conversas: conversas,
                  ),
                ),
              );
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                outroUsuario.urlFotos.isNotEmpty
                  ? outroUsuario.urlFotos.first
                  : 'https://i.imgur.com/YTkSwCJ.png'
              ),
            ),
            title: Text(outroUsuario.nome),
          );
        },
      ),
    );
  }
}
