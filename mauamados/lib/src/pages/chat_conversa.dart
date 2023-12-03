import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/pages/pages.dart';
import 'package:mauamados/src/widgets/widgets.dart';

class ChatConversa extends StatefulWidget{
  final List<dynamic> conversa;
  final int idUsuarioAtual;
  final double fontSize;
  final List<dynamic> conversasAPI;
  final int idOutroUsuario;
  final User outroUsuario;

  const ChatConversa({
    required this.conversasAPI,
    required this.conversa, 
    required this.fontSize, 
    required this.idUsuarioAtual,
    required this.idOutroUsuario,
    required this.outroUsuario,
    super.key
  });

  @override
  State<ChatConversa> createState() {
    return _ChatConversaState();
  }
}

class _ChatConversaState extends State<ChatConversa> {
  ScrollController controller = ScrollController();
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        toolbarHeight: deviceHeight * 0.08,
        leadingWidth: deviceHeight * 0.08,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  conversasAPI: widget.conversasAPI,
                  fontSize: widget.fontSize,
                  idUsuarioAtual: widget.idUsuarioAtual,
                ),
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: const Color.fromARGB(255, 0, 71, 133),
            size: deviceHeight * 0.06,
          ),
        ),
        title: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder:(context) => ProfileMatch(
                  user: widget.outroUsuario,
                  fontSize: widget.fontSize,
                )
              )
            );
          },
          child: Row(
            children: [
              ClipOval(
                child: Image.network(
                  widget.outroUsuario.urlFotos.isNotEmpty
                      ? widget.outroUsuario.urlFotos.first
                      : 'https://i.imgur.com/YTkSwCJ.png',
                  width: deviceHeight * 0.06,
                  height: deviceHeight * 0.06,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  widget.outroUsuario.nome,
                  style: TextStyle(
                    fontSize: widget.fontSize * 4 / 3,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        )
        
      ),
      body: Column(
        children: [
          Expanded(
            child: ChatMessages(
              conversa: widget.conversa,
              fontSize: widget.fontSize,
              idUsuarioAtual: widget.idUsuarioAtual,
              controller: controller,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: deviceHeight * 0.01,
              horizontal: deviceWidth * 0.02,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(fontSize: widget.fontSize),
                    controller: textController,
                    decoration: InputDecoration(
                      labelText: 'Mensagem',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 0, 71, 133)),
                      ),
                    ),
                    maxLines: 5,
                    minLines: 1,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    final messageText = textController.text;
                    if (messageText.isNotEmpty) {
                      setState(() {
                        widget.conversa.add({'remetente': widget.idUsuarioAtual, 'receptor': widget.idOutroUsuario,'corpo': messageText});
                        textController.clear();
                      });
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        controller.jumpTo(controller.position.maxScrollExtent);
                      });
                    }
                  },
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
      ),
    );
  }
}