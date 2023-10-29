import 'package:flutter/material.dart';

class AddWidget extends StatelessWidget {
  final double iconSize;
  final Function(String) onAdd;

  const AddWidget({
    required this.iconSize,
    required this.onAdd,
    super.key
  });

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
    return Container(
      margin: EdgeInsets.all(iconSize * 0.3),
      padding: EdgeInsets.all(iconSize * 0.3),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(90),
      ),
      child: IconButton(
        icon: Icon(
          Icons.add, 
          size: iconSize,
          color: Colors.white70,
        ),
        onPressed: (){
          showDialog(
            context: context,
            builder: (context) {
              TextEditingController linkController = TextEditingController();
              return Center(
                child: SingleChildScrollView(
                  child: AlertDialog(
                    title: Text(
                      "Adicionar Interesse",
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
                            labelText: "Interesse",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  const BorderSide(color: Color.fromARGB(255, 0, 71, 133)),
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
        }
      ),
    );
  }
}