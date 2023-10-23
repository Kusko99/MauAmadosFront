import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/widgets/widgets.dart';

class ChatPage extends StatelessWidget{
  final List<Map<String, dynamic>> conversas;
  final int idUsuarioAtual;

  final double fontSize;

  const ChatPage({required this.conversas, required this.fontSize, required this.idUsuarioAtual, super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

  int idConversa = 0;

  List<int> idsConversa = conversas[idConversa]['ids'];
  int idOutroUsuario = idsConversa.firstWhere((id) => id != idUsuarioAtual);

  User? outroUsuario = User.users.firstWhere((user) => user.id == idOutroUsuario);

  String imageUrlOutroUsuario = outroUsuario.urlFotos.isNotEmpty ? outroUsuario.urlFotos.first : 'https://i.imgur.com/YTkSwCJ.png';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: deviceHeight * 0.08,
          leadingWidth: deviceHeight * 0.08,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: const Color.fromARGB(255, 0, 71, 133),
              size: deviceHeight * 0.06,
            ),
          ),
          title: Row(
            children: [
              ClipOval(
                child: Image.network(
                  imageUrlOutroUsuario,
                  width: deviceHeight * 0.06,
                  height: deviceHeight * 0.06,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Text(
                outroUsuario.nome,
                style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        body: ChatMessages(conversas: conversas, fontSize: fontSize, idUsuarioAtual: idUsuarioAtual,),
      ),
    );
  }
}