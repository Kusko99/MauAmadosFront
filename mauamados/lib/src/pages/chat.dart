import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/widgets/widgets.dart';

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
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    TextEditingController controller = TextEditingController();

    int idConversa = 0;

    List<int> idsConversa = widget.conversas[idConversa]['ids'];
    int idOutroUsuario = idsConversa.firstWhere((id) => id != widget.idUsuarioAtual);

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
              const SizedBox(width: 10),
              Text(
                outroUsuario.nome,
                style: TextStyle(
                  fontSize: widget.fontSize * 4/3,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ChatMessages(conversas: widget.conversas, fontSize: widget.fontSize, idUsuarioAtual: widget.idUsuarioAtual,),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: deviceHeight * 0.01,
                horizontal: deviceWidth * 0.02
              ), 
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(fontSize: widget.fontSize),
                      controller: controller,
                      decoration: InputDecoration(
                        labelText: 'Mensagem',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color.fromARGB(255, 0, 71, 133)),
                        ),
                      ),
                      maxLines: 5,
                      minLines: 1,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.send,
                      color: const Color.fromARGB(255, 0, 71, 133),
                      size: widget.fontSize * 2,
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}