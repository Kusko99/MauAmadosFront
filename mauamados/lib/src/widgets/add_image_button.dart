import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';

class ImageButton extends StatelessWidget {
  final User user;
  final Function(String) onAdd;

  const ImageButton({required this.user, required this.onAdd, super.key});

  @override
  Widget build(BuildContext context) {
    double side = MediaQuery.of(context).size.longestSide;
    double fontSize = side * 0.025;
    if (side * 0.025 < 12) {
      fontSize = 12;
    }
    if (side * 0.025 > 25) {
      fontSize = 25;
    }
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 120,
        minHeight: 158.5,
      ),
      child: Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.shortestSide * 0.02),
        width: MediaQuery.of(context).size.shortestSide * 0.28,
        height: MediaQuery.of(context).size.shortestSide * 0.37,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,
        ),
        child: SizedBox.expand(
          child: IconButton(
            icon: Icon(
              Icons.add,
              size: MediaQuery.of(context).size.shortestSide * 0.08,
              color: Colors.grey[350],
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  TextEditingController linkController = TextEditingController();
                  return Center(
                    child: SingleChildScrollView(
                      child: AlertDialog(
                        title: Text(
                          "Adicionar Imagem",
                          style: TextStyle(
                            fontSize: fontSize,
                          ),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              autofocus: true,
                              controller: linkController,
                              decoration: InputDecoration(
                                labelText: "Link da Imagem",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      const BorderSide(color: Color.fromARGB(255, 158, 189, 255)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Fechar",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 0, 71, 133),
                                fontSize: fontSize * 0.8,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              onAdd(linkController.text);
                            },
                            child: Text(
                              "Adicionar",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 0, 71, 133),
                                fontSize: fontSize * 0.8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
