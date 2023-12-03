import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class ProfileMatch extends StatefulWidget {
  final User user;
  final double fontSize;
  final List<dynamic> conversas;
  final int idUsuarioAtual;

  const ProfileMatch ({
    required this.idUsuarioAtual,
    required this.user,
    required this.fontSize,
    required this.conversas,
    super.key
  });

  @override
  State<ProfileMatch> createState() => _ProfileMatchState();
}

class _ProfileMatchState extends State<ProfileMatch> {
  
  Future<void> deletarConversa(int idUsuarioAtual, int idOutro) async {
    await http.delete(Uri.parse('http://127.0.0.1:8000/delete_chat/$idUsuarioAtual/$idOutro'));
    await http.delete(Uri.parse('http://127.0.0.1:8000/user/remove_like/$idUsuarioAtual/$idOutro'));
    await http.delete(Uri.parse('http://127.0.0.1:8000/user/remove_like/$idOutro/$idUsuarioAtual'));
  }

  @override
  Widget build (BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    if (deviceHeight < deviceWidth) {
      deviceWidth = deviceHeight;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        toolbarHeight: deviceHeight * 0.08,
        leadingWidth: deviceHeight * 0.08,
        foregroundColor: const Color.fromARGB(255, 0, 71, 133),
        iconTheme: IconThemeData(
          color: const Color.fromARGB(255, 0, 71, 133),
          size: deviceHeight * 0.06,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: deviceWidth,
            child: Column(
              children: [
                UserCard(user: widget.user, onUserChanged: (n){}, match: true,),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: deviceHeight * 0.05
                  ),
                  child: Wrap(
                    children: 
                      InterestsBuilder(interesses: widget.user.interesses, fontSize: widget.fontSize).buildInterests()
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: deviceHeight * 0.02,
                    left: deviceWidth * 0.05,
                    right: deviceWidth * 0.05
                  ),
                  child: Text(
                    widget.user.bio,
                    style: TextStyle(
                      fontSize: widget.fontSize,
                      color: Colors.black
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: deviceHeight * 0.05
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BotaoDoMau(
                        onPressed: () {
                          setState(() {
                            widget.conversas.removeWhere((conversa) =>
                              conversa['ma_id_user1'] == widget.user.id || conversa['ma_id_user2'] == widget.user.id
                            );
                          });
                          deletarConversa(widget.idUsuarioAtual, widget.user.id);
                        },
                        fontSize: widget.fontSize, 
                        color: Colors.grey, 
                        texto: 'Desfazer Match'
                      ),
                      BotaoDoMau(
                        onPressed: () {},
                        fontSize: widget.fontSize, 
                        color: const Color.fromARGB(255, 162, 38, 29), 
                        texto: 'Denunciar'
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        )
      ),
    );
  }
}