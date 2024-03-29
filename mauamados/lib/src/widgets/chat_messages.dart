import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  final List<dynamic> conversa;
  final double fontSize;
  final int idUsuarioAtual;
  final ScrollController controller;

  const ChatMessages({
    required this.conversa,
    required this.fontSize,
    required this.idUsuarioAtual,
    required this.controller,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.jumpTo(controller.position.maxScrollExtent);
    });

    return ListView.builder(
      controller: controller,
      itemCount: conversa.length,
      itemBuilder: (context, index) {
        final mensagem = conversa[index];
        final id = mensagem['remetente'];
        final texto = mensagem['corpo'];
        final isMinhaMensagem = id == idUsuarioAtual;
        return Container(
          margin: EdgeInsets.only(
            top: deviceHeight * 0.01,
            bottom: deviceHeight * 0.01,
            left: MediaQuery.of(context).size.width * 0.02,
            right: MediaQuery.of(context).size.width * 0.02,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment:
                isMinhaMensagem ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (!isMinhaMensagem)
                Stack(
                  children: [
                    Positioned(
                      right: 0,
                      child: Container(
                        width: 10,
                        height: 20,
                        color: isMinhaMensagem
                            ? const Color.fromARGB(255, 0, 71, 133)
                            : const Color.fromARGB(255, 158, 189, 255),
                      ),
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
                        color: const Color.fromARGB(255, 250, 250, 255),
                      ),
                    ),
                  ],
                ),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: isMinhaMensagem
                        ? const Color.fromARGB(255, 0, 71, 133)
                        : const Color.fromARGB(255, 158, 189, 255),
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
                        fontSize: fontSize,
                      ),
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
                      color: isMinhaMensagem
                          ? const Color.fromARGB(255, 0, 71, 133)
                          : const Color.fromARGB(255, 158, 189, 255),
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
                        color: const Color.fromARGB(255, 250, 250, 255),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}
