import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget{
  final List<Map<String, dynamic>> conversas;
  final double fontSize;
  final int idUsuarioAtual;

  const ChatMessages({required this.conversas, required this.fontSize, required this.idUsuarioAtual,super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemCount: conversas.length,
      itemBuilder: (context, index) {
        final conversa = conversas[index];
        final mensagens = conversa['mensagens'];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: mensagens.map<Widget>((mensagem) {
            final id = mensagem['id'];
            final texto = mensagem['texto'];
            final isMinhaMensagem = id == idUsuarioAtual;
            return Container(
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.02,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: isMinhaMensagem ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  if (!isMinhaMensagem)
                    Stack(
                      children: [
                        Container(
                          width: 10,
                          height: 20,
                          color: isMinhaMensagem ? const Color.fromARGB(255, 0, 71, 133) : const Color.fromARGB(255, 158, 189, 255),
                        ),
                        Container(
                          width: 10,
                          height: 22,
                          decoration: BoxDecoration(
                            borderRadius: isMinhaMensagem
                                ? const BorderRadius.only(
                                    topLeft: Radius.circular(90),
                                  )
                                : const BorderRadius.only(
                                    topRight: Radius.circular(90),
                                  ),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  Container(
                    decoration: BoxDecoration(
                      color: isMinhaMensagem ? const Color.fromARGB(255, 0, 71, 133) : const Color.fromARGB(255, 158, 189, 255),
                      borderRadius: isMinhaMensagem
                          ? const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              topLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            )
                          : const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        texto,
                        style: TextStyle(
                          color: isMinhaMensagem ? Colors.white : Colors.black,
                          fontSize: fontSize
                        ),
                      ),
                    ),
                  ),
                  if (isMinhaMensagem)
                    Stack(
                      children: [
                        Container(
                          width: 10,
                          height: 20,
                          color: isMinhaMensagem ? const Color.fromARGB(255, 0, 71, 133) : const Color.fromARGB(255, 158, 189, 255),
                        ),
                        Container(
                          width: 12,
                          height: 22,
                          decoration: BoxDecoration(
                            borderRadius: isMinhaMensagem
                                ? const BorderRadius.only(
                                    topLeft: Radius.circular(90),
                                  )
                                : const BorderRadius.only(
                                    topRight: Radius.circular(90),
                                  ),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                ],
              )
            );
          }).toList(),
        );
      },
    );
  }
}