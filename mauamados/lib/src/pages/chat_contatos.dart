import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/pages/pages.dart';
import 'dart:math';

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

    final deviceHeight = MediaQuery.of(context).size.height;

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
          return InkWell(
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
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: deviceHeight * 0.02
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.withAlpha(50),
                    width: 0.1
                  )
                )
              ),
              child: ListTile(
                leading: CircleAvatar(
                  radius: min(max(deviceHeight * 0.05, 36.0), fontSize * 1.8),
                  backgroundImage: NetworkImage(
                    outroUsuario.urlFotos.isNotEmpty
                      ? outroUsuario.urlFotos.first
                      : 'https://i.imgur.com/YTkSwCJ.png'
                  ),
                ),
                title:Text(
                  outroUsuario.nome,
                  style: TextStyle(
                    fontSize: fontSize * 1.25,
                  ),
                  overflow: TextOverflow.ellipsis
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
