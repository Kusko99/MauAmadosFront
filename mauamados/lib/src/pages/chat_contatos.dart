import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/pages/pages.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';

class ChatContatos extends StatelessWidget {
  final int idUsuarioAtual;
  final double fontSize;
  final List<Map<String, dynamic>> conversas;
  final List<dynamic> conversasAPI;

  const ChatContatos({
    required this.conversasAPI,
    required this.idUsuarioAtual,
    required this.fontSize,
    required this.conversas,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    Future<User> getUser(int userId) async {
      final userResponse = await http.get(
        Uri.parse('http://127.0.0.1:8000/user/$userId'),
        headers: {'Accept-Charset': 'utf-8'},
      );
      final userData = json.decode(utf8.decode(userResponse.bodyBytes));
      return User.fromJson(userData[0]);
    }

    final conversasDoUsuario = List<dynamic>.from(conversasAPI)
      .where((conversa) =>
        (conversa['ma_id_user1'] == idUsuarioAtual) &&
        conversa['conversa'].isNotEmpty)
      .toList();

      final matchesDoUsuario = List<dynamic>.from(conversasAPI)
      .where((conversa) =>
        (conversa['ma_id_user1'] == idUsuarioAtual) &&
        conversa['conversa'].isEmpty)
      .toList();

    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    if (deviceHeight < deviceWidth) {
      deviceWidth = deviceHeight;
    }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: min(max(deviceHeight * 0.05, 36.0), fontSize * 1.8)*4.2,
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20)
          )
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Matches',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: fontSize * 1.5
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: min(max(deviceHeight * 0.05, 36.0), fontSize * 1.8)*2.8,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: matchesDoUsuario.length,
                itemBuilder: (context, index) {
                  final match = matchesDoUsuario[index];
                  final idOutroUsuario = match['ma_id_user2'];

                  return FutureBuilder<User>(
                    future: getUser(idOutroUsuario), 
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Erro ao carregar usuário');
                      } else if (!snapshot.hasData) {
                        return Text('Dados do usuário não encontrados');
                      } else {
                        final outroUsuario = snapshot.data!;
                        return Container(
                          margin: EdgeInsets.only(
                            right: deviceWidth * 0.02
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ChatConversa(
                                    conversasAPI: conversasAPI,
                                    conversa: match,
                                    fontSize: fontSize,
                                    idUsuarioAtual: idUsuarioAtual,
                                    conversas: conversas,
                                  ),
                                ),
                              );
                            }, 
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: min(max(deviceHeight * 0.05, 36.0), fontSize * 1.8),
                                  backgroundImage: NetworkImage(
                                    outroUsuario.urlFotos.isNotEmpty
                                      ? outroUsuario.urlFotos.first
                                      : 'https://i.imgur.com/YTkSwCJ.png'
                                  ),
                                ),
                                Text(
                                  outroUsuario.nome,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: fontSize * 0.8
                                  ),
                                )
                              ],
                            ) 
                          )
                        );
                      }
                    }
                  );
                },
              ),
            ),
          ],
        )
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 18,
              top: deviceHeight * 0.02,
              bottom: deviceHeight * 0.02
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.withAlpha(50),
                  width: 0.6
                ),
              ),
            ),
            child: Text(
              'Conversas',
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 71, 133),
                fontSize: fontSize * 1.5,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: conversasDoUsuario.length,
              itemBuilder: (context, index) {
                final conversa = conversasDoUsuario[index];
                final idOutroUsuario = conversa['ma_id_user2'];

                return FutureBuilder<User>(
                  future: getUser(idOutroUsuario), 
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Erro ao carregar usuário');
                    } else if (!snapshot.hasData) {
                      return Text('Dados do usuário não encontrados');
                    } else {
                      final outroUsuario = snapshot.data!;
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ChatConversa(
                                conversasAPI: conversasAPI,
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
                            vertical: deviceHeight * 0.015
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey.withAlpha(50),
                                width: 0.6
                              )
                            )
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: min(max(deviceHeight * 0.05, 36.0), fontSize * 2.25),
                              backgroundImage: NetworkImage(
                                outroUsuario.urlFotos.isNotEmpty
                                  ? outroUsuario.urlFotos.first
                                  : 'https://i.imgur.com/YTkSwCJ.png'
                              ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  outroUsuario.nome,
                                  style: TextStyle(
                                    fontSize: fontSize * 1.2,
                                    fontWeight: FontWeight.bold
                                  ),
                                  overflow: TextOverflow.ellipsis
                                ),
                                Text(
                                  conversa['mensagens'].last['id'] == idUsuarioAtual ? 
                                    'Você: ${conversa['mensagens'].last['texto']}' : 
                                    '${outroUsuario.nome}: ${conversa['mensagens'].last['texto']}',
                                  style: TextStyle(
                                    fontSize: fontSize
                                  ),
                                  overflow: TextOverflow.ellipsis
                                )
                              ],
                            )
                          ),
                        ),
                      );
                    }
                  }
                );
                
              },
            ),
          )
        ],
      )
    );
  }
}